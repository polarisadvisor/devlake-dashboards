# -*- coding: utf-8 -*-
# Author: Krishna Kumar
import pytest

from framework.dashboard import Dashboard
from pathlib import Path


@pytest.fixture(scope='module')
def dashboard(polaris_dashboards_directory: Path):
    yield Dashboard(polaris_dashboards_directory / "PRLeadTimeForChanges.json")


def test_dashboard_path(dashboard):
    assert dashboard is not None


def test_is_not_editable(dashboard):
    assert dashboard.editable is False


def test_top_panels(dashboard):
    assert len(dashboard.panels) == 3


def test_panel_states(dashboard):
    assert dashboard.panel_states == [
        {'collapsed': False, 'title': 'How long does it take for changes on a branch to reach production?', 'type': 'row'},
        {'collapsed': None, 'title': 'Avg. Lead Time for Changes: from initial commit to deployed ','type': 'timeseries'},
        {'collapsed': True, 'title': 'Where is time spent in this process? ', 'type': 'row'}
    ]
