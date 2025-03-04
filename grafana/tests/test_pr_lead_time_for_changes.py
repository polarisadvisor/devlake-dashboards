# -*- coding: utf-8 -*-
# Author: Krishna Kumar
from datetime import UTC, datetime, date
from typing import Generator

import pytest
import pandas as pd

from framework.dashboard import Dashboard, Panel
from pathlib import Path

from framework.pandas_sqlalchemy import insert_dataframe, to_dataframe, assert_data_frames_equal, decimal_to_float, \
    days2minutes
from models import Project, ProjectMapping, PullRequest, ProjectPRMetric
from sqlalchemy.orm import Session
from sqlalchemy import text


@pytest.fixture(scope='module')
def dashboard(polaris_dashboards_directory: Path) -> Generator[Dashboard, None, None]:
    yield Dashboard(polaris_dashboards_directory / "PRLeadTimeForChanges.json")


def test_top_panels(dashboard):
    assert len(dashboard.panels) == 3


def test_panel_states(dashboard):
    assert dashboard.panel_states == [
        {'collapsed': False, 'title': 'How long does it take for changes on a branch to reach production?',
         'type': 'row'},
        {'collapsed': None, 'title': 'Avg. Lead Time for Changes: from initial commit to deployed ',
         'type': 'timeseries'},
        {'collapsed': True, 'title': 'Where is time spent in this process? ', 'type': 'row'}
    ]


@pytest.fixture(scope="function")
def _pull_requests(db_session: Session) -> Generator[dict[str, pd.DataFrame], None, None]:
    """Populates test data using Pandas DataFrames and inserts them into the database while maintaining referential integrity."""

    # Create project data
    projects_df = pd.DataFrame([
        {"name": "TestProject", "description": "A test project", "created_at": datetime.now(UTC),
         "updated_at": datetime.now(UTC)}
    ])

    # Create project mapping
    project_mapping_df = pd.DataFrame([
        {"project_name": "TestProject", "table": "repos", "row_id": "repo_1", "created_at": datetime.now(UTC),
         "updated_at": datetime.now(UTC)}
    ])

    pull_requests_df = pd.DataFrame({
        "id": ["PR_1", "PR_2", "PR_3", "PR_4", "PR_5"],
        "base_repo_id": ["repo_1", "repo_1", "repo_1", "repo_1", "repo_1"],
        "created_date": ["2025-01-01", "2025-01-04", "2025-01-06", "2025-01-08", "2025-01-10"],
        "merged_date": ["2025-01-03", "2025-01-05", "2025-01-07", "2025-01-09", "2025-01-11"],
    })

    pr_metrics_df = pd.DataFrame({
        "id": ["PR_1", "PR_2", "PR_3", "PR_4", "PR_5"],
        "project_name": ["TestProject", "TestProject", "TestProject", "TestProject", "TestProject"],
        "pr_created_date": ["2025-01-01", "2025-01-04", "2025-01-06", "2025-01-08", "2025-01-10"],
        "pr_merged_date": ["2025-01-03", "2025-01-05", "2025-01-07", "2025-01-09", "2025-01-11"],

        # time from first commit to pr raised. Computed by Devlake and stored on the fact table.
        "pr_coding_time": days2minutes([0.5, 0.25, 0.30, 0.5, 0.5]),

        # pr_time_to_merge = merged_date - created_date in days. There is no such field
        # in the schema, so we are adding this here just to document how the cycle time is computed.

        #"pr_time_to_merge": days2minutes([2, 1, 1, 1, 1]),

        # time from PR merged to the next deployment. Computed by Devlake and stored on the fact table.
        "pr_deploy_time": days2minutes([0.5, 0.25, 0.25, 0.25, 0.25]),

        #pr cycle time = pr_coding_time + pr_time_to_merge + pr_deploy_time
        "pr_cycle_time": days2minutes([3, 1.5, 1.85, 1.75, 1.75]),


    })

    # Insert data into the database while respecting referential integrity
    insert_dataframe(db_session, projects_df, Project)
    insert_dataframe(db_session, project_mapping_df, ProjectMapping)
    insert_dataframe(db_session, pull_requests_df, PullRequest)
    insert_dataframe(db_session, pr_metrics_df, ProjectPRMetric)

    db_session.flush()  # Ensure all changes are visible in the transaction
    yield {
        "projects": projects_df,
        "project_mapping": project_mapping_df,
        "pull_requests": pull_requests_df,
        "pr_metrics": pr_metrics_df
    }


class TestPRLeadTimeForChangesPanel:

    @staticmethod
    def test_monthly_trend(dashboard: Dashboard, db_session, _pull_requests):
        panel: Panel = dashboard.find_panel_by_id(109)
        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="DAYOFMONTH",
            time_filter_from="'2025-01-01'",
            time_filter_to="NOW()"

        ))
        assert result.shape == (1, 3)

        expected = pd.DataFrame({
            'time': [date(2025, 1, 1)],
            'lead_time_for_changes': [1.97],
            'count': [5]
        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'lead_time_for_changes'),
            expected
        )

    @staticmethod
    def test_weekly_trend(dashboard: Dashboard, db_session, _pull_requests):
        panel: Panel = dashboard.find_panel_by_id(109)
        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="WEEKDAY",
            time_filter_from="'2025-01-01'",
            time_filter_to="NOW()"

        ))
        assert result.shape == (2, 3)

        expected = pd.DataFrame({
            'time': [date(2024, 12, 31), date(2025, 1, 7)],
            'lead_time_for_changes': [2.25, 1.78333333],
            'count': [2, 3]
        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'lead_time_for_changes'),
            expected
        )

    @staticmethod
    def test_daily_trend(dashboard: Dashboard, db_session, _pull_requests):
        panel: Panel = dashboard.find_panel_by_id(109)
        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="DAY",
            time_filter_from="'2025-01-01'",
            time_filter_to="NOW()"

        ))
        assert result.shape == (5, 3)

        expected = pd.DataFrame({
            'time': [date(2025, 1, 3), date(2025, 1, 5), date(2025, 1, 7), date(2025, 1, 9), date(2025, 1, 11)],
            'lead_time_for_changes': [3.0, 1.5, 1.85, 1.75, 1.75],
            'count': [1, 1, 1, 1, 1]
        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'lead_time_for_changes'),
            expected
        )

    @staticmethod
    def test_time_filtering(dashboard: Dashboard, db_session, _pull_requests):
        panel: Panel = dashboard.find_panel_by_id(109)
        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="DAY",
            time_filter_from="'2025-01-03'",
            time_filter_to="'2025-01-07'"

        ))
        assert result.shape == (3, 3)

        expected = pd.DataFrame({
            'time': [date(2025, 1, 3), date(2025, 1, 5), date(2025, 1, 7)],
            'lead_time_for_changes': [3.0, 1.5, 1.85],
            'count': [1, 1, 1]
        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'lead_time_for_changes'),
            expected
        )

    @staticmethod
    @pytest.fixture()
    def _non_project_pull_requests(db_session: Session, _pull_requests: dict[str, pd.DataFrame]) -> Generator[
        dict[str, pd.DataFrame], None, None]:
        # add an extra pull request from a repo that is not mapped to the current project
        fixture = _pull_requests
        non_project_pr = pd.DataFrame([
            {
                'id': ["PR_6"],
                'base_repo_id': ["repo_2"],
                'created_date': ["2025-01-03"],
                'merged_date': ["2025-01-04"],
            }
        ])
        insert_dataframe(db_session, non_project_pr, PullRequest)
        db_session.flush()
        fixture['pull_requests'] = pd.concat([fixture['pull_requests'], non_project_pr])
        yield fixture

    @staticmethod
    def test_only_project_repos_are_included(dashboard: Dashboard, db_session, _non_project_pull_requests):
        panel: Panel = dashboard.find_panel_by_id(109)
        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="DAY",
            time_filter_from="'2025-01-03'",
            time_filter_to="'2025-01-07'"

        ))
        assert result.shape == (3, 3)

        expected = pd.DataFrame({
            'time': [date(2025, 1, 3), date(2025, 1, 5), date(2025, 1, 7)],
            'lead_time_for_changes': [3.0, 1.5, 1.85],
            'count': [1, 1, 1]
        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'lead_time_for_changes'),
            expected
        )


class TestCodingTimePanel:

    @staticmethod
    def test_monthly_trend(dashboard: Dashboard, db_session, _pull_requests):
        coding_time_panel_id: int = 120
        panel: Panel = dashboard.find_panel_by_id(coding_time_panel_id)
        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="DAYOFMONTH",
            time_filter_from="'2025-01-01'",
            time_filter_to="NOW()"

        ))
        assert result.shape == (1, 2)

        expected = pd.DataFrame({
            'time': [date(2025, 1, 1)],
            'coding_time': [0.41],
        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'coding_time'),
            expected
        )

    @staticmethod
    def test_weekly_trend(dashboard: Dashboard, db_session, _pull_requests):
        coding_time_panel_id: int = 120
        panel: Panel = dashboard.find_panel_by_id(coding_time_panel_id)

        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="WEEKDAY",
            time_filter_from="'2025-01-01'",
            time_filter_to="NOW()"

        ))
        assert result.shape == (2, 2)

        expected = pd.DataFrame({
            'time': [date(2024, 12, 31), date(2025, 1, 7)],
            'coding_time': [0.375, 0.43333333]
        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'coding_time'),
            expected
        )

    @staticmethod
    def test_daily_trend(dashboard: Dashboard, db_session, _pull_requests):
        coding_time_panel_id: int = 120
        panel: Panel = dashboard.find_panel_by_id(coding_time_panel_id)

        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="DAY",
            time_filter_from="'2025-01-01'",
            time_filter_to="NOW()"

        ))
        assert result.shape == (5, 2)

        expected = pd.DataFrame({
            'time': [date(2025, 1, 3), date(2025, 1, 5), date(2025, 1, 7), date(2025, 1, 9), date(2025, 1, 11)],
            'coding_time': [0.5, 0.25, 0.3, 0.5, 0.5],

        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'coding_time'),
            expected
        )

    @staticmethod
    def test_time_filtering(dashboard: Dashboard, db_session, _pull_requests):
        coding_time_panel_id: int = 120
        panel: Panel = dashboard.find_panel_by_id(coding_time_panel_id)

        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="DAY",
            time_filter_from="'2025-01-03'",
            time_filter_to="'2025-01-07'"

        ))
        assert result.shape == (3, 2)

        expected = pd.DataFrame({
            'time': [date(2025, 1, 3), date(2025, 1, 5), date(2025, 1, 7)],
            'coding_time': [0.5, 0.25, 0.3],

        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'coding_time'),
            expected
        )

    @staticmethod
    @pytest.fixture()
    def _non_project_pull_requests(db_session: Session, _pull_requests: dict[str, pd.DataFrame]) -> Generator[
        dict[str, pd.DataFrame], None, None]:
        # add an extra pull request from a repo that is not mapped to the current project
        fixture = _pull_requests
        non_project_pr = pd.DataFrame([
            {
                'id': ["PR_6"],
                'base_repo_id': ["repo_2"],
                'created_date': ["2025-01-03"],
                'merged_date': ["2025-01-04"],
            }
        ])
        insert_dataframe(db_session, non_project_pr, PullRequest)
        db_session.flush()
        fixture['pull_requests'] = pd.concat([fixture['pull_requests'], non_project_pr])
        yield fixture

    @staticmethod
    def test_only_project_repos_are_included(dashboard: Dashboard, db_session, _non_project_pull_requests):
        coding_time_panel_id: int = 120
        panel: Panel = dashboard.find_panel_by_id(coding_time_panel_id)

        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="DAY",
            time_filter_from="'2025-01-03'",
            time_filter_to="'2025-01-07'"

        ))
        assert result.shape == (3, 2)

        expected = pd.DataFrame({
            'time': [date(2025, 1, 3), date(2025, 1, 5), date(2025, 1, 7)],
            'coding_time': [0.5, 0.25, 0.3],

        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'coding_time'),
            expected
        )


class TestTimeToMergePanel:

    @staticmethod
    def test_monthly_trend(dashboard: Dashboard, db_session, _pull_requests):
        time_to_merge_panel_id: int = 122
        panel: Panel = dashboard.find_panel_by_id(time_to_merge_panel_id)
        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="DAYOFMONTH",
            time_filter_from="'2025-01-01'",
            time_filter_to="NOW()"

        ))
        assert result.shape == (1, 2)

        expected = pd.DataFrame({
            'time': [date(2025, 1, 1)],
            'time_to_merge': [1.2],
        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'time_to_merge'),
            expected
        )

    @staticmethod
    def test_weekly_trend(dashboard: Dashboard, db_session, _pull_requests):
        time_to_merge_panel_id: int = 122
        panel: Panel = dashboard.find_panel_by_id(time_to_merge_panel_id)

        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="WEEKDAY",
            time_filter_from="'2025-01-01'",
            time_filter_to="NOW()"

        ))
        assert result.shape == (2, 2)

        expected = pd.DataFrame({
            'time': [date(2024, 12, 31), date(2025, 1, 7)],
            'time_to_merge': [1.5, 1.0]
        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'time_to_merge'),
            expected
        )

    @staticmethod
    def test_daily_trend(dashboard: Dashboard, db_session, _pull_requests):
        time_to_merge_panel_id: int = 122
        panel: Panel = dashboard.find_panel_by_id(time_to_merge_panel_id)

        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="DAY",
            time_filter_from="'2025-01-01'",
            time_filter_to="NOW()"

        ))
        assert result.shape == (5, 2)

        expected = pd.DataFrame({
            'time': [date(2025, 1, 3), date(2025, 1, 5), date(2025, 1, 7), date(2025, 1, 9), date(2025, 1, 11)],
            'time_to_merge': [2, 1, 1, 1, 1],

        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'time_to_merge'),
            expected
        )

    @staticmethod
    def test_time_filtering(dashboard: Dashboard, db_session, _pull_requests):
        time_to_merge_panel_id: int = 122
        panel: Panel = dashboard.find_panel_by_id(time_to_merge_panel_id)

        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="DAY",
            time_filter_from="'2025-01-03'",
            time_filter_to="'2025-01-07'"

        ))
        assert result.shape == (3, 2)

        expected = pd.DataFrame({
            'time': [date(2025, 1, 3), date(2025, 1, 5), date(2025, 1, 7)],
            'time_to_merge': [2,1,1],

        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'time_to_merge'),
            expected
        )

    @staticmethod
    @pytest.fixture()
    def _non_project_pull_requests(db_session: Session, _pull_requests: dict[str, pd.DataFrame]) -> Generator[
        dict[str, pd.DataFrame], None, None]:
        # add an extra pull request from a repo that is not mapped to the current project
        fixture = _pull_requests
        non_project_pr = pd.DataFrame([
            {
                'id': ["PR_6"],
                'base_repo_id': ["repo_2"],
                'created_date': ["2025-01-03"],
                'merged_date': ["2025-01-04"],
            }
        ])
        insert_dataframe(db_session, non_project_pr, PullRequest)
        db_session.flush()
        fixture['pull_requests'] = pd.concat([fixture['pull_requests'], non_project_pr])
        yield fixture

    @staticmethod
    def test_only_project_repos_are_included(dashboard: Dashboard, db_session, _non_project_pull_requests):
        time_to_merge_panel_id: int = 122
        panel: Panel = dashboard.find_panel_by_id(time_to_merge_panel_id)

        panel_sql: str = panel.targets[0]['rawSql']
        result: pd.DataFrame = to_dataframe(dashboard.execute(
            db_session,
            panel_sql,
            project="'TestProject'",
            interval="DAY",
            time_filter_from="'2025-01-03'",
            time_filter_to="'2025-01-07'"

        ))
        assert result.shape == (3, 2)

        expected = pd.DataFrame({
            'time': [date(2025, 1, 3), date(2025, 1, 5), date(2025, 1, 7)],
            'time_to_merge': [2,1,1],

        })

        assert_data_frames_equal(
            # convert Decimal values in result to floats so that can be compared approximately
            decimal_to_float(result, 'time_to_merge'),
            expected
        )
