import json
import boto3
import uuid

from boto3.dynamodb.conditions import Key

dynamodb = boto3.resource('dynamodb', region_name="us-east-2")
table = dynamodb.Table('xodat')

def uploadMatch(event, context):
    body = json.loads(event['body'])
    uploader = body['uploader_uid']

    previouslyUploadedMatches = findUploadedMatchesForUserID(uploader)
    
    for match in body['match_list']:
        if match['match_id'] not in previouslyUploadedMatches:
            uploadMatch(uploader, match)

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

def getUploadRecords(uploader):
    previouslyUploadedMatches = findUploadedMatchesForUserID(uploader)

    return {
        "statusCode": 200,
        "headers": {"Access-Control-Allow-Origin": "*"},
        "body": json.dumps(previouslyUploadedMatches)
    }

def uploadMatch(uploader, match):
    uploadMatchAttributes(match)
    for round in match['rounds']:
        uploadRound(round)
    uploadResources(uploader, match)
    return 

def uploadMatchAttributes(match):
    item = {
        'pk': 'MATCH#' + match['match_id'],
        'sk': 'ATTRIBUTES#',
        'match_type' : match['match_id'],
        'match_classification' : match['match_classification'],
        'match_start' : match['match_start'],
        'match_end' : match['match_end'],
        'map_name' : match['map_name'],
        'map_display_name' : match['map_display_name'],
        'winning_team' : match['winning_team'],
        'win_conidtion' : match['win_conidtion'],
        'client_version' : match['client_version'],
        'co_driver_version' : match['co_driver_version'],
        'host_name' : match['host_name']
    }
    table.put_item(Item=item)
    return

def uploadRound(round):
    roundID = str(uuid.uuid4())
    uploadRoundAttributes(roundID, round)
    for player in round['players']:
        uploadPlayerRound(roundID, player)
    return

def uploadRoundAttributes(roundID, round):
    item = {
        'pk': 'ROUND#' + roundID,
        'sk': 'ATTRIBUTES#',
        'match_type' : round['match_id'],
        'match_classification' : round['match_classification'],
        'match_start' : round['match_start'],
        'match_end' : round['match_end'],
        'map_name' : round['map_name'],
        'map_display_name' : round['map_display_name'],
        'winning_team' : round['winning_team'],
        'win_conidtion' : round['win_conidtion'],
        'client_version' : round['client_version'],
        'co_driver_version' : round['co_driver_version'],
        'host_name' : round['host_name'],
        'round_damage_records' : round['damage_records']
    }
    table.put_item(Item=item)
    return

def uploadPlayerRound(roundID, player):
    item = {
        'pk': 'ROUND#' + roundID,
        'sk': 'USER#' + player['uid'],
        'match_id' : player['match_id'],
        'round_id' : roundID,
        'bot' : player['bot'],
        'nickname' : player['nickname'],
        'team' : player['team'],
        'build_hash' : player['build_hash'],
        'power_score' : player['power_score'],
        'kills' : player['kills'],
        'assists' : player['assists'],
        'drone_kills' : player['drone_kills'],
        'deaths' : player['deaths'],
        'score' : player['score'],
        'damage' : player['damage'],
        'damage_taken' : player['damage_taken'],
        'scores' : player['scores'],
        'medals' : player['medals']
    }
    table.put_item(Item=item)
    return

def uploadResources(uploader, match):
    item = {
        'pk': 'MATCH#' + match['match_id'],
        'sk': 'RESOURCE#USER#' + uploader,
        'resources' : match['resources']
    }
    table.put_item(Item=item)
    return

def uploadBuild(build):
    item = {
        'pk': 'BUILD#' + build['build_hash'],
        'sk': 'POWER_SCORE#' + build['power_score'],
        'parts' : build['parts']
    }
    table.put_item(Item=item)
    return 

def findUploadedMatchesForUserID(uploader):
    pk = Key('pk').eq('USER#' + uploader)
    sk = Key('sk').begins_with('UPLOAD#')
    expression = pk & sk

    uploadRecords = table.query(
        IndexName='xodat',
        KeyConditionExpression=expression
    )

    return uploadRecords['Items']['pk']