import json
import re
from jsonpath_ng import parse
from sqlalchemy import text
from sqlalchemy.orm import Session
from sqlalchemy.engine import Result
from pathlib import Path
from typing import Any

class Panel:
    def __init__(self, panel_id: int, datasource: str, targets: list[dict]):
        self.panel_id = panel_id
        self.datasource = datasource
        self.targets = targets

class Dashboard:
    def __init__(self, json_file: str | Path) -> None:
        with open(json_file, 'r') as f:
            self.data = json.load(f)

    def query(self, jsonpath_expr: str) -> list[Any]:
        """Extract elements using JSONPath notation."""
        expr = parse(jsonpath_expr)
        return [match.value for match in expr.find(self.data)]

    @property
    def variables(self):
        """Extract variable names defined in the dashboard."""
        return [f"${name}" for name in self.query("$.templating.list[*].name")]

    @property
    def panels(self) -> list[dict]:
        """Extract top level panels defined in the dashboard."""
        return self.query("$.panels[*]")

    @property
    def editable(self):
        return self.data["editable"]

    @property
    def panel_states(self) -> list[dict]:
        return [
            {
                "title": panel["title"],
                "type": panel["type"],
                "collapsed": panel.get("collapsed")
            }
            for panel in self.panels
        ]


    def datasources(self, ds_type: str = 'mysql') -> list[dict]:
        datasources = self.query(f"$.panels..datasource[*]")
        return [
            datasource
            for datasource in datasources
            if datasource['type'] == ds_type
        ]

    def find_panel_by_id(self, panel_id: int) -> Panel | None:
        """Find a panel by its ID in the dashboard, including nested panels.

        Args:
            panel_id: The ID of the panel to find

        Returns:
            Panel object if found, None otherwise
        """
        def search_panels(panels: list[dict]) -> Panel | None:
            for panel in panels:
                # Check current panel
                if panel.get('id') == panel_id:
                    return Panel(
                        panel['id'],
                        panel.get('datasource'),  # Some panels might not have datasource
                        panel.get('targets', [])  # Some panels might not have targets
                    )

                # Recursively search in sub-panels if any
                sub_panels = panel.get('panels', [])
                if sub_panels:
                    result = search_panels(sub_panels)
                    if result:
                        return result
            return None

        return search_panels(self.panels)

    def panel_sql(self, panel_id: int):
        return self.query(f"$.panels[*].targets[*].rawSql where parent.parent.id == {panel_id}")

    @staticmethod
    def preprocess(
            sql_query: str,
            time_filter_from: str = "'1970-01-01'",
            time_filter_to: str = "NOW()",
            time_from: str = "'1970-01-01'",
            time_to: str = "NOW()",
            unix_epoch_from: str = "'1970-01-01'",
            unix_epoch_to: str = "NOW()",
            **kwargs: dict[str:Any]  # Arbitrary dashboard-defined substitutions (e.g., project, interval)
    ):
        """
        Preprocess SQL by expanding built-in macros and substituting additional variables.
        Note that all date strings passed must be explicitly quoted ie "'1970-01-01'", not "1970-01-01"

        :param sql_query: The raw SQL query containing macros.
        :param time_filter_from: Start date for $__timeFilter.
        :param time_filter_to: End date for $__timeFilter.
        :param time_from: Value for $__timeFrom.
        :param time_to: Value for $__timeTo.
        :param unix_epoch_from: Value for $__unixEpochFrom.
        :param unix_epoch_to: Value for $__unixEpochTo.
        :param kwargs: Arbitrary key-value pairs for dashboard-defined variables (e.g., project, interval).
        :return: SQL query with macros expanded and custom variables substituted.
        """

        def replace_time_filter(match: re.Match) -> str:
            column = match.group(1)
            return f"{column} BETWEEN {time_filter_from} AND {time_filter_to}"

        # Built-in Grafana macros (explicit replacements)
        replacements = {
            r"\$__timeFilter\((.*?)\)": replace_time_filter,
            r"\$__timeFrom": lambda _: f"{time_from}",
            r"\$__timeTo": lambda _: f"{time_to}",
            r"\$__unixEpochFilter\((.*?)\)": lambda
                match: f"{match.group(1)} BETWEEN UNIX_TIMESTAMP({unix_epoch_from}) AND UNIX_TIMESTAMP({unix_epoch_to})",
            r"\$__unixEpochFrom": lambda _: f"UNIX_TIMESTAMP({unix_epoch_from})",
            r"\$__unixEpochTo": lambda _: f"UNIX_TIMESTAMP({unix_epoch_to})",
            r"\$__timeGroup\((.*?),\s*(.*?)\)": lambda match: f"DATE_TRUNC({match.group(2)}, {match.group(1)})",
            r"\$__timeGroupAlias\((.*?),\s*(.*?)\)": lambda
                match: f"DATE_TRUNC({match.group(2)}, {match.group(1)}) AS time_group",
        }

        # Apply built-in macro replacements
        for pattern, replacer in replacements.items():
            sql_query = re.sub(pattern, replacer, sql_query)

        # Apply additional user-defined substitutions (e.g., $project → 'my_project')
        for key, value in kwargs.items():
            # support variables of the form ${variable}
            sql_query = sql_query.replace(f"${{{key}}}", f"{value}")
            # and also ${variable}
            sql_query = sql_query.replace(f"${key}", f"{value}")

        return sql_query

    @staticmethod
    def execute(session: Session,
                query: str,
                **parameters) -> Result:
        """
         Preprocess SQL query by calling preprocess(), execute it and return the result.
         :param session: SQLAlchemy session object.
         :param query: Grafana SQL query. Potentially contains macros to expand.
         :param parameters: Grafana macro replacement parameters. - These are directly passed to preprocess. See that method for details.
        """
        return session.execute(text(Dashboard.preprocess(query, **parameters)))
