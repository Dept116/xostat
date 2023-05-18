from python.lib.database import *
from .scores import *
from sqlalchemy.dialects.postgresql import insert

batch_data = []

def queue_round_player_scores(db, round_player_id, scores):
    for score in scores:
        score_id = find_score_type_id(db, score['score_type'])
        batch_data.append({'round_player_id': round_player_id, 'score_type_id': score_id, 'score': score['points']})

def upload_round_player_scores(db):
    round_player_scores = db.get_table('round_player_scores')

    if batch_data:
        stmt = insert(round_player_scores).values(batch_data).on_conflict_do_nothing()
        db.execute(stmt)