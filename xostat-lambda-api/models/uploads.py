import os
import datetime
from sqlalchemy import select, create_engine, Table, MetaData
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import SQLAlchemyError

engine = create_engine(
    f"postgresql://{os.environ['DB_USER']}:{os.environ['DB_PASSWORD']}@{os.environ['DB_HOST']}:{os.environ['DB_PORT']}/{os.environ['DB_NAME']}")
Session = sessionmaker(bind=engine)
metadata = MetaData()
uploads = Table('uploads', metadata, autoload_with=engine)


def upload_upload_record(match_id, uploader_user_id):
    session = Session()

    uploaded_at = datetime.datetime.now()

    try:
        ins = uploads.insert().values(match_id=match_id, uploaded_at=uploaded_at,
                                      uploader_user_id=uploader_user_id)

        session.execute(ins)
        session.commit()
    except SQLAlchemyError as e:
        session.rollback()
        print(f"An error occurred: {str(e)}")
        raise
    finally:
        session.close()


def get_uploads_by_user(uploader_user_id):
    # Create a new session
    session = Session()

    try:
        stmt = select(uploads.c.match_id).where(
            uploads.c.uploader_user_id == uploader_user_id)

        results = session.execute(stmt).fetchall()

        match_ids = [result['match_id'] for result in results]

        return match_ids
    except SQLAlchemyError as e:
        print(f"An error occurred: {str(e)}")
        raise

    finally:
        session.close()
