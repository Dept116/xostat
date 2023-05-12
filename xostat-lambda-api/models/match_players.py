from lib.database import *
from sqlalchemy import select, and_


def upload_match_players(db, match, player):
    match_players = db.get_table('match_players')

    match_id = match['match_id']
    user_id = player['uid']

    stmt = select(match_players.c.id).where(
        and_(match_players.c.match_id == match_id, match_players.c.match_id == match_id, match_players.c.user_id == user_id))
    result = db.execute(stmt).fetchone()

    if result is None:
        print(f"uploading match_players:{user_id}")
        stmt = match_players.insert().values(
            match_id=match_id,
            user_id=user_id,
            bot=player['bot'],
            nickname=player['nickname'],
            team=player['team'],
            group_id=player['group_id']
        )
        db.execute(stmt)
        print("done")

        stmt = select(match_players.c.id).where(
            and_(match_players.c.match_id == match_id, match_players.c.match_id == match_id, match_players.c.user_id == user_id))
        result = db.execute(stmt).fetchone()

    return result[0]
