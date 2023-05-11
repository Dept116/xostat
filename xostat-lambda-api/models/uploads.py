import os
import datetime
from lib.database import *
from sqlalchemy import select, create_engine, Table, MetaData
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import SQLAlchemyError


def upload_upload_record(db, match, uploader_user_id):
    uploads = db.get_table('uploads')
    session = Session()
    match_id = match['match_id']

    uploaded_at = datetime.datetime.now()

    try:
        ins = uploads.insert().values(match_id=match_id,
                                      uploaded_at=uploaded_at,
                                      uploader_user_id=uploader_user_id)

        session.execute(ins)
    except SQLAlchemyError as e:
        session.rollback()
        print(f"An error occurred: {str(e)}")
        raise
    finally:
        session.close()


def get_uploads_by_user(db, uploader_user_id):
    try:
        uploads = db.get_table('uploads')

        stmt = select(uploads.c.match_id).where(
            uploads.c.uploader_user_id == uploader_user_id)

        results = db.execute(stmt).fetchall()

        match_ids = [result['match_id'] for result in results]

        return match_ids
    except SQLAlchemyError as e:
        print(f"An error occurred: {str(e)}")
        raise
