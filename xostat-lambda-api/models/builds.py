from lib.database import *
from .parts import *
from sqlalchemy import select, and_


def upload_build_list(db, build_list):
    for build in build_list:
        upload_build(db, build)


def upload_build(db, build):
    build_hash = str(build['build_hash'])
    power_score = int(build['power_score'])
    parts = build['parts']

    builds = db.get_table('builds')

    stmt = select(builds.c.id).where(and_(builds.c.build_hash == build_hash,
                                     builds.c.power_score == power_score))
    result = db.execute(stmt).fetchone()

    if result is None:
        print(f"uploading build:{build_hash}:{power_score}")
        stmt = builds.insert().values(build_hash=build_hash, power_score=power_score)
        result = db.execute(stmt)

        stmt = select(builds.c.id).where(and_(builds.c.build_hash == build_hash,
                                              builds.c.power_score == power_score))
        result = db.execute(stmt).fetchone()

    build_id = result[0]

    upload_parts(db, build_id, parts)


def upload_parts(db, build_id, parts):
    build_parts = db.get_table('build_parts')

    stmt = select(build_parts.c.part_id).where(
        build_parts.c.build_id == build_id)

    existing_part_ids = db.execute(stmt).fetchall()

    for part in parts:
        part_id = find_part_id(db, part)
        if part_id not in (r[0] for r in existing_part_ids):
            print(f"uploading part:{part}")
            stmt = build_parts.insert().values(build_id=build_id, part_id=part_id)
            db.execute(stmt)
