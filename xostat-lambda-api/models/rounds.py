from lib.database import *
from sqlalchemy import select, and_


def upload_round(db, match, round):
    rounds = db.get_table('rounds')

    match_id = match['match_id']
    round_number = round['round_id']

    stmt = select(rounds.c.id).where(
        and_(rounds.c.match_id == match_id, rounds.c.round_number == round_number))
    result = db.execute(stmt).fetchone()

    if result is None:
        print(f"uploading round:{match_id}:{round_number}")
        stmt = rounds.insert().values(
            match_id=match_id,
            round_number=round_number,
            start_at=round['round_start'],
            end_at=round['round_end'],
            winning_team=round['winning_team']
        )
        db.execute(stmt)

        stmt = select(rounds.c.id).where(
            and_(rounds.c.match_id == match_id, rounds.c.round_number == round_number))
        result = db.execute(stmt).fetchone()

    return result[0]
