from python.lib.database import *
from sqlalchemy import select

parts_dict = {}

def initialize_parts_dict(db):
    parts = db.get_table('parts')

    stmt = select(parts.c.id, parts.c.part)
    result = db.execute(stmt).fetchall()

    parts_dict.update({row.part: row.id for row in result})


def find_part_id(db, part):
    if part not in parts_dict:
        result = upload_part(db, part)
        parts_dict[part] = result[0]

    return parts_dict[part]


def upload_part(db, part):
    parts = db.get_table('parts')
    print(f"uploading part:{part}")
    stmt = parts.insert().returning(parts.c.id).values(
        part=part
    )
    return db.execute(stmt).fetchone()
