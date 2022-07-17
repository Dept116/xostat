import json
import boto3
import os
from boto3.dynamodb.conditions import Key

dynamodb = boto3.resource('dynamodb')

TABLE_NAME = os.environ['DYNAMODB_TABLE']
table = dynamodb.Table(TABLE_NAME)

def getUserNames(event, context):
    return ""

def getMatchHistory(event, context):
    return ""

def getUploadRecords(event, context):
    userID = event['pathParameters']['id']
    previouslyUploadedMatches = findUploadedMatchesForUserID(userID)

    return {
        "statusCode": 200,
        "headers": {"Access-Control-Allow-Origin": "*"},
        "body": json.dumps(previouslyUploadedMatches)
    }

def findUploadedMatchesForUserID(uploader):
    pk = Key('pk').eq('USER#' + uploader)
    sk = Key('sk').begins_with('UPLOAD#')
    expression = pk & sk

    uploadRecords = table.query(
        KeyConditionExpression=expression
    )
    
    return uploadRecords['Items']