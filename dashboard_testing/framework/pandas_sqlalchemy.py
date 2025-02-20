import pandas as pd
from sqlalchemy.orm import Session
from models import Base
from typing import Type
from sqlalchemy import Result
from decimal import Decimal
from pandas.testing import assert_frame_equal

def insert_dataframe(session: Session, df: pd.DataFrame, model: Type[Base]) -> None:
    """Bulk insert model records from a pandas DataFrame."""
    session.bulk_insert_mappings(model, df.to_dict(orient="records"))


def to_dataframe(result: Result) -> pd.DataFrame:
    return pd.DataFrame.from_records(
        result.fetchall(), columns=result.keys()
    )

def decimal_to_float(dataframe: pd.DataFrame, *columns: str) -> pd.DataFrame:
    for column in columns:
        dataframe[column] = dataframe[column].apply(
            lambda x: float(x) if isinstance(x, Decimal) else x
        )
    return dataframe

def assert_data_frames_equal(result: pd.DataFrame, expected: pd.DataFrame) -> None:
    assert_frame_equal(
        result,
        expected,
        check_dtype=False,
        check_exact=False,
        atol=1e-5,
        rtol=1e-8)