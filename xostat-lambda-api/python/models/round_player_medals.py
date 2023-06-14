from python.lib.database import *
from .medals import *
from sqlalchemy.dialects.postgresql import insert

batch_data = []

def queue_round_player_medals(db, round_player_id, medals):
    for medal in medals:
        medal_id = find_medal_id(db, medal['medal'])
        batch_data.append({'round_player_id': round_player_id, 'medal_id': medal_id, 'amount': medal['amount']})

def upload_round_player_medals(db):
    round_player_medals = db.get_table('round_player_medals')

    if batch_data:
        stmt = insert(round_player_medals).values(batch_data).on_conflict_do_nothing()
        db.execute(stmt)