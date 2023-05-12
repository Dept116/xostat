from lib.database import *
from sqlalchemy import select


def find_weapon_id(db, weapon):
    weapons = db.get_table('weapons')

    stmt = select(weapons.c.id).where(weapons.c.weapon == weapon)
    result = db.execute(stmt).fetchone()

    if result is None:
        upload_weapon(db, weapons, weapon)

        stmt = select(weapons.c.id).where(
            weapons.c.weapon == weapon)
        result = db.execute(stmt).fetchone()

    return result[0]


def upload_weapon(db, weapons, weapon):
    print(f"uploading weapon:{weapon}")
    stmt = weapons.insert().values(
        weapon=weapon
    )
    db.execute(stmt)
