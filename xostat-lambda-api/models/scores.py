from lib.database import *
from sqlalchemy import select


def find_score_type_id(db, score_type):
    scores = db.get_table('scores')

    stmt = select(scores.c.round_id).where(scores.c.score_type == score_type)
    result = db.execute(stmt).fetchone()

    if result is None:
        upload_score_type(db, scores, score_type)

        stmt = select(scores.c.round_id).where(
            scores.c.score_type == score_type)
        result = db.execute(stmt).fetchone()

    return result['id']


def upload_score_type(db, scores, score_type):
    stmt = scores.insert().values(
        score_type=score_type
    )
    db.execute(stmt)
