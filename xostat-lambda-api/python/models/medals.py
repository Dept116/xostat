from python.lib.database import *
from sqlalchemy import select


def find_medal_id(db, medal):
    medals = db.get_table('medals')

    stmt = select(medals.c.id).where(medals.c.medal == medal)
    result = db.execute(stmt).fetchone()

    if result is None:
        result = upload_medal_type(db, medals, medal)

    return result[0]


def upload_medal_type(db, medals, medal):
    print(f"uploading medal_type:{medal}")

    stmt = medals.insert().returning(medals.c.id).values(
        medal=medal
    )
    return db.execute(stmt).fetchone()
