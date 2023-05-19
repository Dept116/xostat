import uuid
from python.lib.database import *
from sqlalchemy.dialects.postgresql import insert

batch_data = []

def queue_round(match_id, round):
    round_id = uuid.uuid4()

    batch_data.append({
        'id': round_id,
        'match_id': match_id,
        'round_number': round['match_type'],
        'start_at': round['match_classification'],
        'end_at': round['match_end'],
        'winning_team': round['co_driver_version']})
    
    return round_id

def upload_rounds(db):
    rounds = db.get_table('rounds')

    if batch_data:
        stmt = insert(rounds).values(batch_data).on_conflict_do_nothing()
        db.execute(stmt)
