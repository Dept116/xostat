import json
import boto3
import os
from classes.xo_item import xo_item
from boto3.dynamodb.conditions import Key

dynamodb = boto3.resource('dynamodb')

TABLE_NAME = os.environ['DYNAMODB_TABLE']
table = dynamodb.Table(TABLE_NAME)

def load_items():
    pk = Key('pk').begins_with('LOG_NAME#')
    expression = pk

    xoItems = table.query(
        KeyConditionExpression=expression
    )

    itemDict = {}

    for item in xoItems:
        itemDict[item.get('pk')] = xo_item(item.get('local_name'), item.get('name'), item.get('category'), item.get('type'), item.get('crossoutdb_item'), item.get('image'), item.get('image_path'))

    return itemDict