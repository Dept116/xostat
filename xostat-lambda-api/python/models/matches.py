from python.lib.database import *
from sqlalchemy import select, exists


def upload_match(db, match):
    matches = db.get_table('matches')

    print(f"uploading match:{match['match_id']}")

    stmt = select(exists().where(matches.c.id == match['match_id']))
    result = db.execute(stmt).scalar()

    if not result:
        stmt = matches.insert().values(
            id=match['match_id'],
            type=match['match_type'],
            classification=match['match_classification'],
            start_at=match['match_start'],
            end_at=match['match_end'],
            map_name=match['map_name'],
            winning_team=match['winning_team'],
            win_condition=match['win_conidtion'],
            client_version=match['client_version'],
            co_driver_version=match['co_driver_version'],
            host_name=match['host_name']
        )
        db.execute(stmt)
