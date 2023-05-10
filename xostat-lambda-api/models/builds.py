import os
from lib.database import *
from sqlalchemy import select, create_engine, Table, MetaData, and_
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import SQLAlchemyError


def upload_build_list(db, build_list):
    for build in build_list:
        upload_build(db, build)


def upload_build(db, build):
    build_hash = str(build['build_hash'])
    power_score = int(build['power_score'])
    parts = build['parts']

    builds = db.get_table('builds')

    stmt = select(builds).where(and_(builds.c.build_hash ==
                                     build_hash, builds.c.power_score == power_score))
    result = db.execute(stmt).fetchone()

    if result is None:
        stmt = builds.insert().values(build_hash=build_hash, power_score=power_score)
        result = db.execute(stmt)

        stmt = select(builds).where(and_(builds.c.build_hash ==
                                         build_hash, builds.c.power_score == power_score))
        result = db.execute(stmt).fetchone()

    build_id = result['build_id']
    upload_parts(db, build_id, parts)


def upload_parts(db, build_id, parts):
    build_parts = db.get_table('build_parts')

    stmt = select(build_parts.c.parts).where(
        build_parts.c.build_id == build_id)
    existing_parts = [row['parts'] for row in db.execute(stmt)]

    new_parts = set(parts) - set(existing_parts)

    for part in new_parts:
        stmt = build_parts.insert().values(build_id=build_id, parts=part)
        db.execute(stmt)
