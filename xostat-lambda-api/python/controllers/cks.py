
from python.lib.response import *
from python.models.cks import *
from python.lib.database import *
from sqlalchemy.exc import SQLAlchemyError

def load_cks(event, context):
    db = Database()

    try:
        insert_cks(db)

        db.commit()
    except SQLAlchemyError as e:
        db.rollback()
        print (f"Internal Server Error: {str(e)}")
    except Exception as e:
        db.rollback()
        print (f"An unexpected error occurred: {str(e)}")
    finally:
        db.close()
