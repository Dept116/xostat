from python.lib.database import *
from sqlalchemy import select

score_types_dict = {}

def initialize_score_types_dict(db):
    score_types = db.get_table('scores')

    stmt = select(score_types.c.id, score_types.c.score_type)
    result = db.execute(stmt).fetchall()

    score_types_dict.update({row.score_type: row.id for row in result})


def find_score_type_id(db, score_type):
    if score_type not in score_types_dict:
        result = upload_score_type(db, score_type)
        score_types_dict[score_type] = result[0]

    return score_types_dict[score_type]


def upload_score_type(db, score_type):
    score_types = db.get_table('scores')
    #print(f"uploading score_type:{score_type}")
    stmt = score_types.insert().returning(score_types.c.id).values(
        score_type=score_type
    )
    return db.execute(stmt).fetchone()
