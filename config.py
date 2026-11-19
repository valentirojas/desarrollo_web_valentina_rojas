import os
from urllib.parse import quote_plus

DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "3306")
DB_NAME = os.getenv("DB_NAME", "tarea2")
DB_USER = os.getenv("DB_USER", "cc5002")
DB_PASSWORD = os.environ["DB_PASSWORD"]

DATABASE_URL = (
    f"mysql+pymysql://{quote_plus(DB_USER)}:"
    f"{quote_plus(DB_PASSWORD)}@"
    f"{DB_HOST}:{DB_PORT}/{DB_NAME}"
)
