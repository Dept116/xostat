from lib.database import *
from scores import *
from sqlalchemy import select, and_, exists


def upload_player_round_scores(db, player_round_id, scores):
    player_round_scores = db.get_table('player_round_scores')

    for score in scores:
        score_id = find_score_type_id(score['score_type'])

        stmt = select(exists().where(and_(player_round_scores.c.player_round_id == player_round_id,
                                          player_round_scores.c.score_type_id == score_id)))
        result = db.execute(stmt).scalar()

        if not result:
            stmt = player_round_scores.insert().values(
                player_round_id=player_round_id,
                score_type_id=score_id,
                score=score['points']
            )
            db.execute(stmt)
