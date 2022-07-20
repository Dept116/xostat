import json
import boto3
import os
from boto3.dynamodb.conditions import Key

dynamodb = boto3.resource('dynamodb')

TABLE_NAME = os.environ['DYNAMODB_TABLE']
table = dynamodb.Table(TABLE_NAME)

def get_user_names(event, context):
    return ""

def get_match_history(event, context):
    return ""

def get_upload_records(event, context):
    userID = event['pathParameters']['id']
    previouslyUploadedMatches = find_uploaded_matches_for_user_id(userID)

    return {
        "statusCode": 200,
        "headers": {"Access-Control-Allow-Origin": "*"},
        "body": json.dumps(previouslyUploadedMatches)
    }

def find_uploaded_matches_for_user_id(uploader):
    pk = Key('pk').eq('USER#' + str(uploader))
    sk = Key('sk').begins_with('UPLOAD#')
    expression = pk & sk

    uploadRecords = table.query(
        KeyConditionExpression=expression
    )
    
    return uploadRecords['Items']