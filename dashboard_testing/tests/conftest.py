# conftest.py
from framework.db import *

@pytest.fixture(scope='module')
def fixture_path(request):
    """Returns the absolute path to the test fixtures directory."""
    return os.path.join(os.path.dirname(request.fspath), "fixtures")
