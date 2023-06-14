from python.lib.database import *
from sqlalchemy.dialects.postgresql import insert

batch_data = []

def queue_match(match):
    print(f"uploading match:{match['match_id']}")
    batch_data.append({
        'id': match['match_id'],
        'type': match['match_type'],
        'classification': match['match_classification'],
        'start_at': match['match_end'],
        'end_at': match['match_end'],
        'map_name': match['map_name'],
        'winning_team': match['winning_team'],
        'win_condition': match['win_conidtion'],
        'client_version': match['client_version'],
        'co_driver_version': match['co_driver_version'],
        'host_name': match['host_name']})
    
    return match['match_id']



def upload_match_records(db):
    matches = db.get_table('matches')

    if batch_data:
        stmt = insert(matches).values(batch_data).on_conflict_do_nothing()
        db.execute(stmt)