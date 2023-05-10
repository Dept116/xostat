import os
from lib.database import *
from sqlalchemy import select, create_engine, Table, MetaData, and_
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import SQLAlchemyError
from uploads import get_uploads_by_user, upload_upload_record


def upload_match_list(db, metadata, uploader, match_list):

    matches = db.get_table('matches')

    uploaded_matches = set(get_uploads_by_user(uploader)['uploaded_matches'])

    for match in match_list:
        if match['match_id'] not in uploaded_matches:
            upload_upload_record(match['id'], uploader)

            stmt = select(matches).where(matches.c.id == match['id'])
            result = db.execute(stmt).fetchone()

            if result is None:
                # If the match does not exist, insert it
                stmt = matches.insert().values(
                    id=match['id'],
                    classification=match['classification'],
                    start_at=match['start_at'],
                    end_at=match['end_at'],
                    map_name=match['map_name'],
                    winning_team=match['winning_team'],
                    win_condition=match['win_condition'],
                    client_version=match['client_version'],
                    co_driver_version=match['co_driver_version'],
                    host_name=match['host_name']
                )
                db.execute(stmt)
