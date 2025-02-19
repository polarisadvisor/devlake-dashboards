# -*- coding: utf-8 -*-
# Author: Krishna Kumar
from datetime import UTC, datetime, timedelta
from typing import Generator

import pytest
import pandas as pd
from pandas.core.interchange.dataframe_protocol import DataFrame

from framework.dashboard import Dashboard, Panel
from pathlib import Path

from framework.pandas_sqlalchemy import insert_dataframe
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
def _pull_requests(db_session: Session) -> Generator[dict[str,DataFrame], None, None]:
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

    # Add pull requests
    pr_data = [
        {
            "id": f"PR_{i}",
            "base_repo_id": "repo_1",
            "merged_date": datetime.now(UTC) - timedelta(days=i * 2),
            "created_date": datetime.now(UTC) - timedelta(days=i * 3),
        }
        for i in range(1, 6)
    ]
    pull_requests_df = pd.DataFrame(pr_data)

    # Add PR metrics
    pr_metrics_data = [
        {
            "id": f"PR_{i}",
            "project_name": "TestProject",
            "pr_cycle_time": i * 1440,  # Simulated cycle time in minutes
            "pr_merged_date": datetime.now(UTC) - timedelta(days=i * 2),
        }
        for i in range(1, 6)
    ]
    pr_metrics_df = pd.DataFrame(pr_metrics_data)

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
    result = dashboard.execute(db_session, panel_sql, project="'TestProject'", interval="DAYOFMONTH").fetchall()
    assert len(result) == 1