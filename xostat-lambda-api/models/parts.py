from lib.database import *
from sqlalchemy import select


def find_part_id(db, part):
    parts = db.get_table('parts')

    stmt = select(parts.c.id).where(parts.c.part == part)
    result = db.execute(stmt).fetchone()

    if result is None:
        upload_part(db, parts, part)

        stmt = select(parts.c.id).where(
            parts.c.part == part)
        result = db.execute(stmt).fetchone()

    return result[0]


def upload_part(db, parts, part):
    print(f"uploading part:{part}")
    stmt = parts.insert().values(
        part=part
    )
    db.execute(stmt)
