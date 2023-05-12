from lib.database import *
from sqlalchemy import select


def find_medal_id(db, medal):
    medals = db.get_table('medals')

    stmt = select(medals.c.id).where(medals.c.medal == medal)
    result = db.execute(stmt).fetchone()

    if result is None:
        upload_medal_type(db, medals, medal)

        stmt = select(medals.c.id).where(
            medals.c.medal == medal)
        result = db.execute(stmt).fetchone()

    return result[0]


def upload_medal_type(db, medals, medal):
    print(f"uploading medal_type:{medal}")

    stmt = medals.insert().values(
        medal=medal
    )
    db.execute(stmt)
