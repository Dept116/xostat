from sqlalchemy import select

from python.lib.database import *
from .resources import *
from sqlalchemy import select, and_, exists


def upload_match_player_resources(db, uploader_match_player_id, resources):
    match_player_resources = db.get_table('match_player_resources')

    for resource in resources:
        resource_id = find_resource_id(db, resource['resource'])

        stmt = select(exists().where(and_(match_player_resources.c.match_player_id == uploader_match_player_id,
                                          match_player_resources.c.resource_id == resource_id)))
        result = db.execute(stmt).scalar()

        if not result:
            print(f"uploading match_resources:{resource_id}")

            stmt = match_player_resources.insert().values(
                match_player_id=uploader_match_player_id,
                resource_id=resource_id,
                amount=resource['amount']
            )
            db.execute(stmt)
