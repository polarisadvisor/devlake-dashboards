import pytest
from sqlalchemy import select, exc
from models.domain import Project  # Your SQLAlchemy models


def test_create_user(db_session):
    """Example test using the transaction fixture"""
    # Setup: Create test data
    new_project = Project(
        name="testproject",
        description="test description",
    )
    db_session.add(new_project)
    db_session.flush()  # Flush to get the ID without committing

    # Test: Query the database
    result = db_session.execute(
        select(Project).where(Project.name == "testproject")
    ).scalar_one()

    # Assertions
    assert result.name == "testproject"
    assert result.description == "test description"


def test_duplicate_project_error(db_session):
    """Example test expecting an error"""
    # Create first user
    project1 = Project(
        name="testproject",
        description="test description",
    )
    db_session.add(project1)
    db_session.flush()

    # Try to create duplicate user - should raise error
    user2 =Project(
        name="testproject",
        description="test description",
    )
    db_session.add(user2)

    # Assert that the appropriate error is raised
    with pytest.raises(exc.IntegrityError):
        db_session.flush()


def test_after_error(db_session):
    """This test verifies that the database is clean after an error in previous test"""
    result = db_session.execute(
        select(Project).where(Project.name == "testproject")
    ).scalars().all()

    assert len(result) == 0  # Database should be clean