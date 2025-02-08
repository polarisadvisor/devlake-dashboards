import os
import pytest
from pathlib import Path

def dashboard_dir(module_path):
    return Path(module_path).parent / "../dashboards/2. Polaris Open Source"

@pytest.fixture(scope='module')
def polaris_dashboards_directory(request):
    """Returns the absolute path to the test fixtures directory."""
    return dashboard_dir(request.fspath)

