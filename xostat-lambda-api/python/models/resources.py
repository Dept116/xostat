from python.lib.database import *
from sqlalchemy import select

resources_dict = {}

def initialize_resources_dict(db):
    resources = db.get_table('resources')

    stmt = select(resources.c.id, resources.c.resource)
    result = db.execute(stmt).fetchall()

    resources_dict.update({row.resource: row.id for row in result})


def find_resource_id(db, resource):
    if resource not in resources_dict:
        result = upload_resource(db, resource)
        resources_dict[resource] = result[0]

    return resources_dict[resource]


def upload_resource(db, resource):
    resources = db.get_table('resources')
    #print(f"uploading resource:{resource}")
    stmt = resources.insert().returning(resources.c.id).values(
        resource=resource
    )
    return db.execute(stmt).fetchone()
