
import os 
import boto3
import json
from sqlalchemy import select, and_
from sqlalchemy.dialects.postgresql import insert

batch_data = []

def insert_cks(db):
    is_offline = os.getenv('IS_OFFLINE')
    json_data = load_ck_from_local() if is_offline else load_ck_from_s3()
    cks = db.get_table('cks')

    for ck in json_data:
        batch_data.append({'ck': ck['CKName'], 'name': ck['Name']})

    if batch_data:
        stmt = insert(cks).values(batch_data).on_conflict_do_nothing()
        db.execute(stmt)

def load_ck_from_s3():
    bucket_name = os.getenv('BUCKET_NAME')
    file_key = os.getenv('FILE_KEY')

    s3 = boto3.client('s3')
    try:
        data = s3.get_object(Bucket=bucket_name, Key=file_key)
        file_content = data['Body'].read().decode('utf-8')
        return json.loads(file_content)
    except Exception as e:
        return None

def load_ck_from_local():
    with open('/devops/static_assets/ck.json', 'r') as f:
        data = json.load(f)
    return data
