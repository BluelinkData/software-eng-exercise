import pytest
from flask import Response

from sync_app import app as sync_app


@pytest.fixture
def app():
    sync_app.debug = True
    sync_app.response_class = Response
    return sync_app
