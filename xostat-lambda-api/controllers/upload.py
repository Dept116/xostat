import sys
import json
import datetime
import os

from decimal import *
from lib.response import *
from models.builds import *
from models.matches import *
from lib.database import *
from .profile import find_uploads_for_user_id


def upload_matches(data, context):
    body = json.loads(data.get('body'))
    uploader = body.get('uploader_uid')
    if uploader is None:
        return build_response(500, "Invalid uid, upload aborted")

    db = Database()

    uploader = int(uploader)

    try:
        upload_build_list(db, body.get('build_list', []))
        upload_match_list(db, uploader, body.get('match_list', []))

        db.commit()
    except SQLAlchemyError as e:
        db.rollback()
        return build_response(500, f"Internal Server Error: {str(e)}")
    finally:
        db.close()

    return build_response(200, "Data fetched successfully", json.dumps(find_uploads_for_user_id(uploader)))
