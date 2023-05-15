from lib.database import *
from sqlalchemy import select


def find_part_id(db, part):
    parts = db.get_table('parts')

    stmt = select(parts.c.id).where(parts.c.part == part)
    result = db.execute(stmt).fetchone()

    if result is None:
        result = upload_part(db, parts, part)

    return result[0]


def upload_part(db, parts, part):
    print(f"uploading part:{part}")
    stmt = parts.insert().returning(parts.c.id).values(
        part=part
    )
    return db.execute(stmt).fetchone()
