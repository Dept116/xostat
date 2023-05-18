import json

from decimal import *
from python.lib.response import *
from python.models.uploads import *
from python.models.builds import *
from python.models.matches import *
from python.models.match_players import *
from python.models.match_player_resources import *
from python.models.rounds import *
from python.models.round_players import *
from python.models.round_player_scores import *
from python.models.round_player_medals import *
from python.models.round_player_damages import *
from python.lib.database import *
from sqlalchemy.exc import SQLAlchemyError


def upload_matches(data, context):
    try:
        body = json.loads(data.get('body'))
    except json.JSONDecodeError:
        return build_response(400, "Invalid JSON, upload aborted")
    except UnicodeDecodeError as e:
        return build_response(400, "Invalid encoding, upload aborted")

    uploader = body.get('uploader_uid')
    if uploader is None:
        return build_response(400, "Missing uploader_uid, upload aborted")

    db = Database()

    build_list = body.get('build_list', [])
    match_list = body.get('match_list', [])

    try:
        initialize_parts_dict(db)
        initialize_weapons_dict(db)
        initialize_medals_dict(db)
        initialize_score_types_dict(db)
        initialize_resources_dict(db)
        
        upload_build_list(db, build_list)
        process_match_list(db, uploader, match_list)

        db.commit()
    except SQLAlchemyError as e:
        db.rollback()
        return build_response(500, f"Internal Server Error: {str(e)}")
    except Exception as e:
        #print(f"An unexpected error occurred: {str(e)}")
        db.rollback()
        return build_response(500, f"An unexpected error occurred: {str(e)}")
    finally:
        db.close()

    return build_upload_response(get_uploads_by_user(db, uploader))


def process_match_list(db, uploader, match_list):
    uploaded_matches = set(get_uploads_by_user(db, uploader))

    for match in match_list:
        if match['match_id'] not in uploaded_matches:
            uploader_match_player_id = None
            queue_upload_record(db, match, uploader)
            upload_match(db, match)

            for round in match['rounds']:
                round_id = upload_round(db, match, round)

                for player in round['players']:

                    if round['round_id'] == 0:
                        match_player_id = upload_match_players(db, match, player)

                        if player['uid'] == uploader:
                            uploader_match_player_id = match_player_id

                    round_player_id = upload_round_players(db, match, round_id, player)
                    queue_round_player_scores(db, round_player_id, player['scores'])
                    queue_round_player_medals(db, round_player_id, player['medals'])
                    queue_round_player_damages(db, player['uid'], round_player_id, round['damage_records'])

            if uploader_match_player_id is not None:
                queue_match_player_resources(db, uploader_match_player_id, match['resources'])

    upload_upload_records(db)
    upload_round_player_scores(db)
    upload_round_player_medals(db)
    upload_round_player_damages(db)
    upload_match_player_resources(db)
