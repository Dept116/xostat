from lib.database import *
from .medals import *
from sqlalchemy import select, and_, exists


def upload_player_round_medals(db, player_round_id, medals):
    player_round_medals = db.get_table('player_round_medals')

    for medal in medals:
        medal_id = find_medal_id(medal['medal'])

        stmt = select(exists().where(and_(player_round_medals.c.player_round_id == player_round_id,
                                          player_round_medals.c.medal_id == medal_id)))
        result = db.execute(stmt).scalar()

        if not result:
            stmt = player_round_medals.insert().values(
                player_round_id=player_round_id,
                medal_id=medal_id,
                amount=medal['amount']
            )
            db.execute(stmt)
