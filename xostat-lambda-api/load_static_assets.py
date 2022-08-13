import boto3
import urllib.request
import json

dynamodb = boto3.resource('dynamodb', region_name="us-east-2")
table = dynamodb.Table('xodat')

def update_item_definitions(event, context):
    
    log_items = json.loads(urllib.request.urlopen("https://s3.us-east-2.amazonaws.com/xostat.gg/static_assets/items.json").read())
    xodb_items = json.loads(urllib.request.urlopen("https://crossoutdb.com/api/v2/items").read())

    for log_item in log_items['res']:
        for xodb_item in xodb_items:
            if xodb_item['name'] == log_item['enName']:
                item = {
                    'pk': 'LOG_NAME#' + log_item['name'],
                    'sk': 'NAME#' + log_item['enName'],
                    'xodb_id' : xodb_item['id'],
                    'category': xodb_item['categoryName'],
                    'type': xodb_item['typeName'],
                    'image' : xodb_item['image'],
                    'imagePath' : xodb_item['imagePath']
                }
                table.put_item(Item=item)
                break
        
    return 