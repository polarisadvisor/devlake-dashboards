# conftest.py
import os
import pytest
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, Session
from sqlalchemy.pool import QueuePool
from pymysql.constants import CLIENT

DATABASE_URL = os.getenv("DATABASE_URL", "mysql+pymysql://test:test@mysql:3306/lake")


def get_engine():
    """Create a singleton engine instance with connection pooling for MySQL"""
    if not hasattr(get_engine, "_engine"):
        get_engine._engine = create_engine(
            DATABASE_URL,
            poolclass=QueuePool,  # Default pool for MySQL (allows multiple connections)
            pool_size=5,  # Number of persistent connections (adjust as needed)
            max_overflow=10,  # Allow up to 10 additional connections when the pool is full
            pool_recycle=1800,  # Recycle connections every 30 minutes to avoid MySQL timeouts
            pool_pre_ping=True,  # Ensures connections are alive before use
        )
    return get_engine._engine


@pytest.fixture(scope="session")
def engine():
    """Session-scoped fixture for database engine.

    Creates a single database engine instance that's shared across all tests.
    """
    engine = get_engine()

    # Optional: Create all tables before running tests
    # from models import Base
    # Base.metadata.create_all(bind=engine)

    yield engine

    # Optional: Drop all tables after tests
    # Base.metadata.drop_all(bind=engine)


@pytest.fixture(scope="session")
def SessionLocal(engine):
    """Session-scoped fixture for session factory.

    Creates a factory for making new database sessions. The factory itself
    is shared across all tests, but each test gets its own session.
    """
    return sessionmaker(
        bind=engine,
        autocommit=False,
        autoflush=False,
    )


@pytest.fixture
def db_session(SessionLocal):
    """Function-scoped fixture for database session with transaction.

    Each test gets a fresh session with its own transaction.
    The transaction is automatically rolled back after the test,
    ensuring test isolation.
    """
    session: Session = SessionLocal()

    try:
        yield session
    except Exception:
        session.rollback()  # Always rollback on error
        raise  # Re-raise the exception
    else:
        session.rollback()  # Rollback even on success
    finally:
        session.close()


@pytest.fixture
def clean_db(engine):
    """Optional fixture to ensure database is clean before each test.

    This is useful if you're not using transactions or need to test
    committed data. Be careful as this is much slower than using
    transaction rollbacks.
    """
    # Optional: Drop and recreate all tables
    # from models import Base
    # Base.metadata.drop_all(bind=engine)
    # Base.metadata.create_all(bind=engine)
    yield