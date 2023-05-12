from lib.database import *
from sqlalchemy import select, and_


def upload_round_players(db, match, round_id, player):
    round_players = db.get_table('round_players')

    match_id = match['match_id']
    user_id = player['uid']

    stmt = select(round_players.c.id).where(
        and_(round_players.c.match_id == match_id, round_players.c.round_id == round_id, round_players.c.user_id == user_id))
    result = db.execute(stmt).fetchone()

    if result is None:
        print(f"uploading round_players:{user_id}")
        stmt = round_players.insert().values(
            match_id=match_id,
            round_id=round_id,
            user_id=user_id,
            build_hash=player['build_hash'],
            power_score=player['power_score'],
            kills=player['kills'],
            assists=player['assists'],
            drone_kills=player['drone_kills'],
            deaths=player['deaths'],
            score=player['score'],
            damage=player['damage'],
            damage_received=player['damage_taken']
        )
        db.execute(stmt)
        print("done")

        stmt = select(round_players.c.id).where(
            and_(round_players.c.match_id == match_id, round_players.c.round_id == round_id, round_players.c.user_id == user_id))
        result = db.execute(stmt).fetchone()

    return result[0]
