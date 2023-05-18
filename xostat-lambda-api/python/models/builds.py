from collections import defaultdict
from python.lib.database import *
from .parts import *
from sqlalchemy import select, and_
from sqlalchemy.dialects.postgresql import insert

def upload_build_list(db, build_list):
    batch_data = []
    parts_data = defaultdict(list)

    builds = db.get_table('builds')
    
    for build in build_list:
        build_hash = str(build['build_hash'])
        power_score = int(build['power_score'])
        parts = build['parts']

        stmt = select(builds.c.id).where(and_(builds.c.build_hash == build_hash,
                                         builds.c.power_score == power_score))
        result = db.execute(stmt).fetchone()

        if result is None:
            print(f"uploading build:{build_hash}:{power_score}")
            batch_data.append({'build_hash': build_hash, 'power_score': power_score})

        parts_data[(build_hash, power_score)].extend(parts)

    if batch_data:
        stmt = builds.insert().returning(builds.c.id, builds.c.build_hash, builds.c.power_score).values(batch_data)
        results = db.execute(stmt).fetchall()

    upload_parts(db, results, parts_data)

def upload_parts(db, builds, parts_data):
    build_parts = db.get_table('build_parts')

    batch_data = []
    for result in builds:
        build_id, build_hash, power_score = result
        parts = parts_data[(build_hash, power_score)]

        for part in parts:
            part_id = find_part_id(db, part)
            print(f"uploading part:{part}")
            batch_data.append({'build_id': build_id, 'part_id': part_id})

    if batch_data:
        stmt = insert(build_parts).values(batch_data).on_conflict_do_nothing()
        db.execute(stmt)