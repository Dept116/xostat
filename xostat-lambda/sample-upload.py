import boto3
import json 
from boto3.dynamodb.conditions import Key

dynamodb = boto3.client('dynamodb', region_name="us-east-2")

def upload():
    with open('sample-data.json', 'r') as datafile:
        matches = json.load(datafile)
    for match in matches:
        print(match)
        item = {
                'pk':{'S':match['match']},
                'sk':{'S':match['user']},
                'kills':{'S': str(match['kills'])},
                'assits':{'S': str(match['assits'])},
                'deaths':{'S': str(match['deaths'])}
        }
        print(item)
        response = dynamodb.put_item(
            TableName='xodat', 
            Item=item
        )
        print("UPLOADING ITEM")
        print(response)

upload()