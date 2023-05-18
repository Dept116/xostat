from python.lib.database import *
from sqlalchemy import select

medals_dict = {}

def initialize_medals_dict(db):
    medals = db.get_table('medals')

    stmt = select(medals.c.id, medals.c.medal)
    result = db.execute(stmt).fetchall()

    medals_dict.update({row.medal: row.id for row in result})


def find_medal_id(db, medal):
    if medal not in medals_dict:
        result = upload_medal(db, medal)
        medals_dict[medal] = result[0]

    return medals_dict[medal]


def upload_medal(db, medal):
    medals = db.get_table('medals')
    #print(f"uploading medal:{medal}")
    stmt = medals.insert().returning(medals.c.id).values(
        medal=medal
    )
    return db.execute(stmt).fetchone()
