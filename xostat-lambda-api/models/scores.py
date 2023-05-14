from lib.database import *
from sqlalchemy import select


def find_score_type_id(db, score_type):
    scores = db.get_table('scores')

    stmt = select(scores.c.id).where(scores.c.score_type == score_type)
    result = db.execute(stmt).fetchone()

    if result is None:
        result = upload_score_type(db, scores, score_type)

    return result[0]


def upload_score_type(db, scores, score_type):
    print(f"uploading score_type:{score_type}")
    stmt = scores.insert().returning(scores.c.id).values(
        score_type=score_type
    )
    return db.execute(stmt).fetchone()
