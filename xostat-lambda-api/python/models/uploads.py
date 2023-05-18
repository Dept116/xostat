import datetime
from python.lib.database import *
from sqlalchemy import select
from sqlalchemy.dialects.postgresql import insert

batch_data = []

def queue_upload_record(db, match, uploader_user_id):
    uploads = db.get_table('uploads')
    match_id = match['match_id']
    uploaded_at = datetime.datetime.now()

    #print(f"uploading upload:{match_id}")
    batch_data.append({'match_id': match_id, 'uploaded_at': uploaded_at, 'uploader_user_id': uploader_user_id})

def upload_upload_records(db):
    uploads = db.get_table('uploads')

    if batch_data:
        stmt = insert(uploads).values(batch_data).on_conflict_do_nothing()
        db.execute(stmt)

def get_uploads_by_user(db, uploader_user_id):
    uploads = db.get_table('uploads')

    stmt = select(uploads.c.match_id).where(
        uploads.c.uploader_user_id == uploader_user_id)

    results = db.execute(stmt).fetchall()

    match_ids = [result[0] for result in results]

    return match_ids
