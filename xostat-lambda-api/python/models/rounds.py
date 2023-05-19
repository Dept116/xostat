import uuid
from python.lib.database import *
from sqlalchemy.dialects.postgresql import insert

batch_data = []

def queue_round(match_id, round):
    round_id = uuid.uuid4()

    batch_data.append({
        'id': round_id,
        'match_id': match_id,
        'round_number':  round['round_id'],
        'start_at': round['round_start'],
        'end_at': round['round_end'],
        'winning_team': round['winning_team']})
    
    return round_id

def upload_rounds(db):
    rounds = db.get_table('rounds')

    if batch_data:
        stmt = insert(rounds).values(batch_data).on_conflict_do_nothing()
        db.execute(stmt)
