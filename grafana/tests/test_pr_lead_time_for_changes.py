# -*- coding: utf-8 -*-
# Author: Krishna Kumar
from datetime import UTC, datetime, date
from typing import Generator

import pytest
import pandas as pd



from framework.dashboard import Dashboard, Panel
from pathlib import Path

from framework.pandas_sqlalchemy import insert_dataframe, to_dataframe,assert_data_frames_equal, decimal_to_float
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
        {'collapsed': False, 'title': 'How long does it take for changes on a branch to reach production?', 'type': 'row'},
        {'collapsed': None, 'title': 'Avg. Lead Time for Changes: from initial commit to deployed ','type': 'timeseries'},
        {'collapsed': True, 'title': 'Where is time spent in this process? ', 'type': 'row'}
    ]


@pytest.fixture(scope="function")
def _pull_requests(db_session: Session) -> Generator[dict[str,pd.DataFrame], None, None]:
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
        "merged_date" : ["2025-01-03", "2025-01-05", "2025-01-07", "2025-01-09", "2025-01-11"],
    })

    pr_metrics_df = pd.DataFrame({
        "id": ["PR_1", "PR_2", "PR_3", "PR_4", "PR_5"],
        "project_name": ["TestProject", "TestProject", "TestProject", "TestProject", "TestProject"],
        "pr_cycle_time": [1440*2, 1440, 1440, 1440, 1440],
        "pr_merged_date": ["2025-01-03", "2025-01-05", "2025-01-07", "2025-01-09", "2025-01-11"]
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


def test_lead_time_for_changes_query(dashboard: Dashboard, db_session, _pull_requests):

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
    #awkward column name, so using a constant here.
    lead_time_for_changes: str = 'Avg. Lead Time for Changes (d)'
    expected = pd.DataFrame({
        'time': [date(2025,1,1)],
        lead_time_for_changes: [1.2],
        'Count': [5]
    })

    assert_data_frames_equal(
        # convert Decimal values in result to floats so that can be compared approximately
        decimal_to_float(result, lead_time_for_changes),
        expected
    )