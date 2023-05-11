import os
from lib.database import *
from sqlalchemy import select


def upload_match(db, match):
    matches = db.get_table('matches')

    stmt = select(matches).where(matches.c.id == match['id'])
    result = db.execute(stmt).fetchone()

    if result is None:
        stmt = matches.insert().values(
            id=match['id'],
            classification=match['classification'],
            start_at=match['start_at'],
            end_at=match['end_at'],
            map_name=match['map_name'],
            winning_team=match['winning_team'],
            win_condition=match['win_condition'],
            client_version=match['client_version'],
            co_driver_version=match['co_driver_version'],
            host_name=match['host_name']
        )
        db.execute(stmt)
