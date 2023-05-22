
from python.lib.response import *
from ..models.cks import *
from python.lib.database import *
from sqlalchemy.exc import SQLAlchemyError

def load_cks(event, context):
    db = Database()

    try:
        insert_cks(db)
    except SQLAlchemyError as e:
        print (f"Internal Server Error: {str(e)}")
    except Exception as e:
        print (f"An unexpected error occurred: {str(e)}")
    finally:
        db.close()
