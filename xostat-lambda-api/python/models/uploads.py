import datetime
from python.lib.database import *
from sqlalchemy import select, and_, exists


def upload_upload_record(db, match, uploader_user_id):
    uploads = db.get_table('uploads')
    match_id = match['match_id']

    uploaded_at = datetime.datetime.now()

    print(f"uploading upload:{match_id}")

    stmt = select(exists().where(and_(uploads.c.match_id == match_id,
                                      uploads.c.uploader_user_id == uploader_user_id)))
    result = db.execute(stmt).scalar()

    if not result:
        ins = uploads.insert().values(match_id=match_id,
                                      uploaded_at=uploaded_at,
                                      uploader_user_id=uploader_user_id)

        db.execute(ins)


def get_uploads_by_user(db, uploader_user_id):
    uploads = db.get_table('uploads')

    stmt = select(uploads.c.match_id).where(
        uploads.c.uploader_user_id == uploader_user_id)

    results = db.execute(stmt).fetchall()

    match_ids = [result[0] for result in results]

    return match_ids
