import uuid
from python.lib.database import *
from sqlalchemy.dialects.postgresql import insert

batch_data = []
def queue_round_players(match, round_id, player):
    id = uuid.uuid4()

    batch_data.append({
        'id':id,
        'match_id': match['match_id'],
        'round_id': round_id,
        'user_id': player['uid'],
        'build_hash': player['build_hash'],
        'power_score': player['power_score'],
        'kills': player['kills'],
        'assists': player['assists'],
        'drone_kills': player['drone_kills'],
        'deaths': player['deaths'],
        'score': player['score'],
        'damage': player['damage'],
        'damage_received': player['damage_taken'],
        'group_id': player['group_id'],
        'group_id': player['group_id']})

    return id

def upload_round_players(db):
    round_players = db.get_table('round_players')

    if batch_data:
        stmt = insert(round_players).values(batch_data).on_conflict_do_nothing()
        db.execute(stmt)