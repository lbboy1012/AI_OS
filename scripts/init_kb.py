from __future__ import annotations

import argparse
import sqlite3
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_DB = ROOT / "knowledge_base" / "knowledge_base.sqlite"
SCHEMA_PATH = ROOT / "schemas" / "knowledge_base.sql"


def init_database(db_path: Path) -> None:
    db_path.parent.mkdir(parents=True, exist_ok=True)
    schema_sql = SCHEMA_PATH.read_text(encoding="utf-8")

    with sqlite3.connect(db_path) as connection:
        connection.executescript(schema_sql)
        connection.commit()


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Initialize the AI Agent OS knowledge base.")
    parser.add_argument("--db", type=Path, default=DEFAULT_DB, help="SQLite database path.")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    init_database(args.db)
    print(f"Knowledge base initialized: {args.db}")


if __name__ == "__main__":
    main()

