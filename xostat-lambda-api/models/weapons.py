from lib.database import *
from sqlalchemy import select


def find_weapon_id(db, weapon):
    weapons = db.get_table('weapons')

    stmt = select(weapons.c.id).where(weapons.c.weapon == weapon)
    result = db.execute(stmt).fetchone()

    if result is None:
        result = upload_weapon(db, weapons, weapon)

    return result[0]


def upload_weapon(db, weapons, weapon):
    print(f"uploading weapon:{weapon}")
    stmt = weapons.insert().returning(weapons.c.id).values(
        weapon=weapon
    )
    return db.execute(stmt).fetchone()
