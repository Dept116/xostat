import uuid
from python.lib.database import *
from sqlalchemy.dialects.postgresql import insert

batch_data = []

def queue_match_players(match, player):
    id = uuid.uuid4()

    batch_data.append({
        'id':id,
        'match_id': match['match_type'],
        'user_id': player['uid'],
        'bot': player['bot'],
        'nickname': player['nickname'],
        'team': player['team'],
        'group_id': player['group_id']})

    return id

def upload_match_players(db):
    matches = db.get_table('matches')

    if batch_data:
        stmt = insert(matches).values(batch_data).on_conflict_do_nothing()
        db.execute(stmt)