from lib.database import *
from .medals import *
from sqlalchemy import select, and_, exists


def upload_round_player_medals(db, round_player_id, medals):
    round_player_medals = db.get_table('round_player_medals')

    for medal in medals:
        medal_id = find_medal_id(db, medal['medal'])

        stmt = select(exists().where(and_(round_player_medals.c.round_player_id == round_player_id,
                                          round_player_medals.c.medal_id == medal_id)))
        result = db.execute(stmt).scalar()

        if not result:
            print(f"uploading round_medals:{medal_id}")
            stmt = round_player_medals.insert().values(
                round_player_id=round_player_id,
                medal_id=medal_id,
                amount=medal['amount']
            )
            db.execute(stmt)
