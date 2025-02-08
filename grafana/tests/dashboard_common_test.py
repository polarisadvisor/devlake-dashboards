import pytest
from pathlib import Path
from framework.dashboard import Dashboard
from conftest import dashboard_dir

def get_dashboard_files(module_path):
    """Get all dashboard JSON files relative to the test module."""
    dashboards_dir = dashboard_dir(module_path)
    return list(dashboards_dir.glob('*.json'))

def pytest_generate_tests(metafunc):
    """Dynamically generate test parameters using the module path."""
    if 'dashboard' in metafunc.fixturenames:
        dashboards = get_dashboard_files(metafunc.module.__file__)
        # Create a list of test IDs using dashboard file names
        ids = [f"dashboard:{path.stem}" for path in dashboards]
        metafunc.parametrize('dashboard', dashboards, indirect=True, ids=ids)

@pytest.fixture(scope="class")
def dashboard(request):
    """Fixture that loads different dashboards dynamically."""
    return Dashboard(request.param)

class TestCommonDashboards:
    """Tests that apply to all dashboards in the directory."""

    def test_dashboard_path(self, dashboard):
        """Ensure dashboard loads correctly."""
        assert dashboard is not None

    def test_is_not_editable(self, dashboard):
        """Ensure dashboards are not editable."""
        assert dashboard.editable is False

    def test_datasource_ids(self, dashboard):
        """Ensure all datasources are MySQL."""
        assert all(ds["uid"] == "mysql" for ds in dashboard.datasources())
