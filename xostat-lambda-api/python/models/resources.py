from python.lib.database import *
from sqlalchemy import select


def find_resource_id(db, resource):
    resources = db.get_table('resources')

    stmt = select(resources.c.id).where(resources.c.resource == resource)
    result = db.execute(stmt).fetchone()

    if result is None:
        result = upload_resource(db, resources, resource)

    return result[0]


def upload_resource(db, resources, resource):
    print(f"uploading resource:{resource}")
    stmt = resources.insert().returning(resources.c.id).values(
        resource=resource
    )
    return db.execute(stmt).fetchone()
