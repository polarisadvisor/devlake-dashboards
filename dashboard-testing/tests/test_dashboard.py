import pytest
import os
from framework.dashboard import Dashboard
from models import Project
import random
from datetime import datetime, timedelta
from sqlalchemy import text

@pytest.fixture(scope='module')
def fixture_path(request):
    """Returns the absolute path to the test fixtures directory."""
    return os.path.join(os.path.dirname(request.fspath), "fixtures")

@pytest.fixture(scope='module')
def sample_dashboard_path(fixture_path):
    """Fixture to provide the path to the actual sample dashboard JSON file."""
    return os.path.join(fixture_path, "sample_dashboard.json")

@pytest.fixture(scope="module")  # Runs once per test module
def dashboard(sample_dashboard_path):
    assert os.path.exists(sample_dashboard_path)

    dashboard = Dashboard(sample_dashboard_path)
    yield dashboard  # Hand over the instance to the tests
    # Teardown (if needed)
    del dashboard


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

class TestExecute:

    @pytest.fixture
    def setup(self, db_session):
        """Setup fixture to create 10 projects with different created_at dates."""

        projects = []
        start_date = datetime(2024, 1, 1)
        end_date = datetime(2024, 12, 1)



        # Generate additional random projects
        for i in range(10):  # 8 more projects to make 10 total
            name = f"project_{i + 3}"  # Avoid clashing with "project_a" and "project_b"

            # Ensure at least 3 projects are created in May 2024
            if i < 3:
                created_at = datetime(2024, 5, random.randint(1, 31))  # Random May date
            else:
                random_days = random.randint(0, (end_date - start_date).days)
                created_at = start_date + timedelta(days=random_days)

            projects.append(Project(name=name, created_at=created_at))

        # Add all projects to the session

        db_session.add_all(projects)
        db_session.flush()

        yield

    def test_execute(self, setup, db_session, dashboard):
        raw_sql = """SELECT * FROM projects
                                 WHERE $__timeFilter(created_at) 
                                 """

        result = dashboard.execute(
            db_session,
            raw_sql,
            time_filter_from="2024-01-01",
            time_filter_to="2024-12-31"
        )
        assert len(result.fetchall()) == 10


