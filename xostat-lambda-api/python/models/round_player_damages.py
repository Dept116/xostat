from python.lib.database import *
from sqlalchemy import select

from python.lib.database import *
from .weapons import *
from sqlalchemy import select, and_, exists


def upload_round_player_damages(db, user_id, round_player_id, damages):
    round_player_damages = db.get_table('round_player_damages')

    for damage in damages:
        if damage['uid'] == user_id:
            weapon_id = find_weapon_id(db, damage['weapon'])

            stmt = select(exists().where(and_(round_player_damages.c.round_player_id == round_player_id,
                                              round_player_damages.c.weapon_id == weapon_id)))
            result = db.execute(stmt).scalar()

            if not result:
                print(f"uploading round_damages:{weapon_id}")

                stmt = round_player_damages.insert().values(
                    round_player_id=round_player_id,
                    weapon_id=weapon_id,
                    damage=damage['damage']
                )
                db.execute(stmt)
