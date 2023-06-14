import uuid
from python.lib.database import *
from sqlalchemy.dialects.postgresql import insert

batch_data = []

def queue_match_players(match, player):
    id = uuid.uuid4()

    batch_data.append({
        'id':id,
        'match_id': match['match_id'],
        'user_id': player['uid'],
        'bot': player['bot'],
        'nickname': player['nickname'],
        'team': player['team'],
        'group_id': player['group_id']})

    return id

def upload_match_players(db):
    match_players = db.get_table('match_players')

    if batch_data:
        stmt = insert(match_players).values(batch_data).on_conflict_do_nothing()
        db.execute(stmt)