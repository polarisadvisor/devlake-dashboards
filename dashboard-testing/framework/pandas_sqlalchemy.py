import pandas as pd
from sqlalchemy.orm import Session
from models import Base
from typing import Type

def insert_dataframe(session: Session, df: pd.DataFrame,  model: Type[Base]) -> None:
    """Bulk insert model records from a pandas DataFrame."""
    session.bulk_insert_mappings(model, df.to_dict(orient="records"))
