from python.lib.database import *
from sqlalchemy import select

weapons_dict = {}

def initialize_weapons_dict(db):
    weapons = db.get_table('weapons')

    stmt = select(weapons.c.id, weapons.c.weapon)
    result = db.execute(stmt).fetchall()

    weapons_dict.update({row.weapon: row.id for row in result})


def find_weapon_id(db, weapon):
    if weapon not in weapons_dict:
        result = upload_weapon(db, weapon)
        weapons_dict[weapon] = result[0]

    return weapons_dict[weapon]


def upload_weapon(db, weapon):
    weapons = db.get_table('weapons')
    #print(f"uploading weapon:{weapon}")
    stmt = weapons.insert().returning(weapons.c.id).values(
        weapon=weapon
    )
    return db.execute(stmt).fetchone()
