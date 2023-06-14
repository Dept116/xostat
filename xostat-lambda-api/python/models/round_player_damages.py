from python.lib.database import *
from .weapons import *
from sqlalchemy.dialects.postgresql import insert

batch_data = []

def queue_round_player_damages(db, user_id, round_player_id, damages):
    for damage in damages:
        if damage['uid'] == user_id:
            weapon_id = find_weapon_id(db, damage['weapon'])
            batch_data.append({'round_player_id': round_player_id, 'weapon_id': weapon_id, 'damage': damage['damage']})

def upload_round_player_damages(db):
    round_player_damages = db.get_table('round_player_damages')

    if batch_data:
        stmt = insert(round_player_damages).values(batch_data).on_conflict_do_nothing()
        db.execute(stmt)