from lib.database import *
from sqlalchemy import select

from lib.database import *
from .weapons import *
from sqlalchemy import select, and_, exists


def upload_player_round_damages(db, user_id, player_round_id, damages):
    player_round_damages = db.get_table('player_round_damages')

    for damage in damages:
        if damage['uid'] == user_id:
            weapon_id = find_weapon_id(damage['weapon'])

            stmt = select(exists().where(and_(player_round_damages.c.player_round_id == player_round_id,
                                              player_round_damages.c.weapon_id == weapon_id)))
            result = db.execute(stmt).scalar()

            if not result:
                stmt = player_round_damages.insert().values(
                    player_round_id=player_round_id,
                    weapon_id=weapon_id,
                    damage=damage['damage']
                )
                db.execute(stmt)
