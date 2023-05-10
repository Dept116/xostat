import os
import datetime
from sqlalchemy import select, create_engine, Table, MetaData, and_
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import SQLAlchemyError

engine = create_engine(
    f"postgresql://{os.environ['DB_USER']}:{os.environ['DB_PASSWORD']}@{os.environ['DB_HOST']}:{os.environ['DB_PORT']}/{os.environ['DB_NAME']}")
Session = sessionmaker(bind=engine)
metadata = MetaData()
builds = Table('builds', metadata, autoload_with=engine)
build_parts = Table('build_parts', metadata, autoload_with=engine)


def upload_build_list(build_list):
    session = Session()

    try:
        for build in build_list:
            upload_build(session, build)

        session.commit()
    except SQLAlchemyError as e:
        session.rollback()
        print(f"An error occurred: {str(e)}")
        raise
    finally:
        session.close()


def upload_build(session, build):
    build_hash = str(build['build_hash'])
    power_score = int(build['power_score'])
    parts = build['parts']

    stmt = select(builds).where(and_(builds.c.build_hash ==
                                     build_hash, builds.c.power_score == power_score))
    result = session.execute(stmt).fetchone()

    if result is None:
        stmt = builds.insert().values(build_hash=build_hash, power_score=power_score)
        result = session.execute(stmt)

        stmt = select(builds).where(and_(builds.c.build_hash ==
                                         build_hash, builds.c.power_score == power_score))
        result = session.execute(stmt).fetchone()

    build_id = result['build_id']
    upload_parts(session, build_id, parts)


def upload_parts(session, build_id, parts):
    stmt = select(build_parts.c.parts).where(
        build_parts.c.build_id == build_id)
    existing_parts = [row['parts'] for row in session.execute(stmt)]

    new_parts = set(parts) - set(existing_parts)

    for part in new_parts:
        stmt = build_parts.insert().values(build_id=build_id, parts=part)
        session.execute(stmt)
