from lib.database import *
from sqlalchemy import select, and_


def upload_player_rounds(db, match, round_id, player):
    player_rounds = db.get_table('player_rounds')

    match_id = match['match_id']
    user_id = player['uid']

    stmt = select(player_rounds.c.id).where(
        and_(player_rounds.c.match_id == match_id, player_rounds.c.round_id == round_id, player_rounds.c.user_id == user_id))
    result = db.execute(stmt).fetchone()

    if result is None:
        print(f"uploading player_rounds:{user_id}")
        stmt = player_rounds.insert().values(
            match_id=match_id,
            round_id=round_id,
            user_id=user_id,
            bot=player['bot'],
            nickname=player['nickname'],
            team=player['team'],
            group_id=player['group_id'],
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

        stmt = select(player_rounds.c.id).where(
            and_(player_rounds.c.match_id == match_id, player_rounds.c.round_id == round_id, player_rounds.c.user_id == user_id))
        result = db.execute(stmt).fetchone()

    return result[0]
