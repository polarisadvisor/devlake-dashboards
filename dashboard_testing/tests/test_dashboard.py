import pytest
import os
from sqlalchemy.engine import Result
from sqlalchemy.orm import Session
import pandas as pd
from typing import Generator, Type

from framework.dashboard import Dashboard
from framework.pandas_sqlalchemy import insert_dataframe
from models import Project




@pytest.fixture(scope='module')
def sample_dashboard_path(fixture_path):
    """Fixture to provide the path to the actual sample dashboard JSON file."""
    return os.path.join(fixture_path, "sample_dashboard.json")


@pytest.fixture(scope="module")  # Runs once per test module
def dashboard(sample_dashboard_path):
    assert os.path.exists(sample_dashboard_path)

    dashboard = Dashboard(sample_dashboard_path)
    yield dashboard


def test_dashboard_variables(dashboard):
    """Test that the Dashboard correctly loads the actual file and extracts variables."""
    assert dashboard.variables == ["$project", "$interval"]


def test_dashboard_panels(dashboard):
    assert len(dashboard.panels) == 3


def test_preprocess(dashboard):
    raw_sql = """SELECT * FROM projects
                     WHERE $__timeFilter(created_at) 
                     AND $__timeGroup(created_at, 'day') 
                     AND $__timeFrom < created_at AND created_at < $__timeTo
                     AND name = $project AND interval = $interval"""

    result = dashboard.preprocess(
        raw_sql,
        time_filter_from="2024-01-01",
        time_filter_to="2024-12-31",
        time_from="2024-01-01",
        time_to="2024-12-31",
        project="MyProject",
        interval="DAYOFMONTH"
    )

    assert result == """SELECT * FROM projects
                     WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31' 
                     AND DATE_TRUNC('day', created_at) 
                     AND '2024-01-01' < created_at AND created_at < '2024-12-31'
                     AND name = 'MyProject' AND interval = 'DAYOFMONTH'"""


@pytest.fixture()
def _query_projects(db_session) -> Generator[pd.DataFrame, None, None]:
    projects: pd.DataFrame = pd.DataFrame({
        "name": [f"Project {i}" for i in range(1, 11)],
        "created_at": pd.date_range(start="2024-01-01", periods=10, freq="D")
    })
    insert_dataframe(db_session, projects, Project)
    yield projects


def test_query_projects(_query_projects: pd.DataFrame, db_session: Session, dashboard: Dashboard):
    expected_df: pd.DataFrame = _query_projects

    query: str = """SELECT name,created_at FROM projects
                                     WHERE $__timeFilter(created_at) 
                                     """
    result: Result = dashboard.execute(
        db_session,
        query,
        time_filter_from="2024-01-01",
        time_filter_to="2024-12-31"
    )
    assert len(expected_df) == len(result.fetchall())
