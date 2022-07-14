import json
import boto3

def getUserNames(event, context):
    return ""

def getMatchHistory(event, context):
    return ""

def hello(event, context):
    body = {
        "message": "Go Serverless v3.0! Your function executed successfully!",
        "input": event,
    }

    response = {"statusCode": 200, "body": json.dumps(body)}

    return response
