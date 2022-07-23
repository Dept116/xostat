import json
import boto3
import uuid

from decimal import Decimal
from profile import find_uploaded_matches_for_user_id
from boto3.dynamodb.conditions import Key

dynamodb = boto3.resource('dynamodb', region_name="us-east-2")
table = dynamodb.Table('xodat')

def upload_matches(event, context):
    uploader = event['uploader_uid']

    previously_uploaded_match = find_uploaded_matches_for_user_id(uploader)
    
    for match in event['match_list']:
        if match['match_id'] not in previously_uploaded_match:
            upload_match(uploader, match)

    # for build in body['build_list']:
    #     upload_build(build)

    return {
        'statusCode': 200,
        'headers': {'Access-Control-Allow-Origin': '*'},
        'body': event
    }

def upload_match(uploader, match):
    upload_match_attributes(match)
    for round in match['rounds']:
       upload_round(round)
    upload_resources(uploader, match)
    return 

def upload_upload_record(uploader, match):
    item = {
        'pk': 'USER#' + str(uploader),
        'sk': 'UPLOAD#' + str(match['match_id'])
    }
    table.put_item(Item=item)
    return

def upload_match_attributes(match):
    item = {
        'pk': 'MATCH#' + str(match['match_id']),
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

def upload_round(round):
    roundID = str(uuid.uuid4())
    upload_round_attributes(roundID, round)
    for player in round['players']:
        upload_player_round(roundID, player)
    return

def upload_round_attributes(roundID, round):
    item = {
        'pk': 'ROUND#' + str(roundID),
        'sk': 'ATTRIBUTES#',
        'round_start' : round['round_start'],
        'round_end' : round['round_end'],
        'winning_team' : round['winning_team']
    }
    table.put_item(Item=item)
    return

def upload_player_round(roundID, player):
    item = {
        'pk': 'ROUND#' + str(roundID),
        'sk': 'USER#' + str(player['uid']),
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
        'damage' : str(player['damage']),
        'damage_taken' : str(player['damage_taken']),
        'scores' : player['scores'],
        'medals' : player['medals']
    }
    table.put_item(Item=item)
    return

def upload_resources(uploader, match):
    item = {
        'pk': 'MATCH#' + str(match['match_id']),
        'sk': 'RESOURCE#USER#' + str(uploader),
        'resources' : match['resources']
    }
    table.put_item(Item=item)
    return

def upload_build(build):
    item = {
        'pk': 'BUILD#' + str(build['build_hash']),
        'sk': 'POWER_SCORE#' + str(build['power_score']),
        'parts' : build['parts']
    }
    table.put_item(Item=item)
    return 