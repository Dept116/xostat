from python.lib.database import *
from sqlalchemy import select, and_, exists
from .scores import *


def upload_round_player_scores(db, round_player_id, scores):
    round_player_scores = db.get_table('round_player_scores')

    for score in scores:
        score_id = find_score_type_id(db, score['score_type'])

        stmt = select(exists().where(and_(round_player_scores.c.round_player_id == round_player_id,
                                          round_player_scores.c.score_type_id == score_id)))
        result = db.execute(stmt).scalar()
        if not result:
            print(f"uploading round_scores:{score_id}")
            stmt = round_player_scores.insert().values(
                round_player_id=round_player_id,
                score_type_id=score_id,
                score=score['points']
            )
            db.execute(stmt)
