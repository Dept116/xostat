from python.lib.database import *
from .resources import *
from sqlalchemy.dialects.postgresql import insert

batch_data = []

def queue_match_player_resources(db, uploader_match_player_id, resources):
    for resource in resources:
        resource_id = find_resource_id(db, resource['resource'])
        batch_data.append({'match_player_id': uploader_match_player_id, 'resource_id': resource_id, 'amount': resource['amount']})

def upload_match_player_resources(db):
    match_player_resources = db.get_table('match_player_resources')

    if batch_data:
        stmt = insert(match_player_resources).values(batch_data).on_conflict_do_nothing()
        db.execute(stmt)