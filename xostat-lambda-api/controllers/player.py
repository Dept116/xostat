import os
import json

from decimal import *
from lib.response import *
from lib.database import *
from models.uploads import get_uploads_by_user
from sqlalchemy.exc import SQLAlchemyError


def get_upload_records(event, context):
    print("got here")

    db = Database()

    print("got here")

    try:
        user_id = event['pathParameters']['id']
        if not user_id.isdigit():
            return build_response(400, "'id' must be a number.")

        upload_records = get_uploads_by_user(db, user_id)
        return build_response(200, "Data fetched successfully", json.dumps(upload_records))

    except KeyError:
        return build_response(400, "'id' must be provided in the path parameters.")
    except SQLAlchemyError as e:
        return build_response(500, f"Internal Server Error: {str(e)}")
    except Exception as e:
        return build_response(500, f"An unexpected error occurred: {str(e)}")
    finally:
        db.close()


def get_user_names(event, context):
    return ""


def get_match_history(event, context):
    return ""
