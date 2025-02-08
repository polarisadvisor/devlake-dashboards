import os
import pytest
from pathlib import Path

@pytest.fixture(scope='module')
def polaris_dashboards_directory(request):
    """Returns the absolute path to the test fixtures directory."""
    return Path(request.fspath).parent / "../dashboards/2. Polaris Open Source"

