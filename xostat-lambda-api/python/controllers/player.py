from decimal import *
from python.lib.response import *
from python.lib.database import *
from python.models.uploads import get_uploads_by_user
from sqlalchemy.exc import SQLAlchemyError


def get_upload_records(event, context):
    db = Database()

    try:
        user_id = event['pathParameters']['id']
        if not user_id.isdigit():
            return build_response(400, "'id' must be a number.")
        
        return build_upload_response(get_uploads_by_user(db, user_id))

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
