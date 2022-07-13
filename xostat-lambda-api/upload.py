import json
import boto3

dynamodb = boto3.resource('dynamodb', region_name="us-east-2")
table = dynamodb.Table('xodat')

def uploadMatch(event, context):
    body = json.loads(event['body'])
    uploader = body['uploader_uid']

    for match in body['match_list']:
        uploadMatch(match)

    for build in body['build_list']:
        uploadBuild(build)

    body = {
        "message": "Sucess!",
        "input": event,
    }

    return {
        'statusCode': 200,
        'headers': {'Access-Control-Allow-Origin': '*'},
        'body': json.dumps(body)
    }

def getUploadRecords():
    return ""

def uploadMatch(match):
    return ""

def uploadBuild(build):
    return ""