from lib.database import *
from sqlalchemy import select


def find_resource_id(db, resource):
    resources = db.get_table('resources')

    stmt = select(resources.c.id).where(resources.c.resource == resource)
    result = db.execute(stmt).fetchone()

    if result is None:
        upload_resource(db, resources, resource)

        stmt = select(resources.c.id).where(
            resources.c.resource == resource)
        result = db.execute(stmt).fetchone()

    return result[0]


def upload_resource(db, resources, resource):
    print(f"uploading resource:{resource}")
    stmt = resources.insert().values(
        resource=resource
    )
    db.execute(stmt)
