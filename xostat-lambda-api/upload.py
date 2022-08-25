import json
import boto3

from decimal import *
from classes.decoder import *
from profile import find_uploaded_matches_for_user_id
from item_definitions import get_item_dict
from boto3.dynamodb.conditions import Key

dynamodb = boto3.resource('dynamodb', region_name="us-east-2")
table = dynamodb.Table('xodat')

def upload_matches(event, context):
    uploader = event['uploader_uid']
    previously_uploaded_match = find_uploaded_matches_for_user_id(uploader)
    item_dict = get_item_dict()

    # for build in event['build_list']:
    #     upload_build(build)

    # for match in event['match_list']:
    #     if match['match_id'] not in previously_uploaded_match:
    #         upload_match(uploader, match)

    return {
        'statusCode': 200,
        'headers': {'Access-Control-Allow-Origin': '*'},
        'body': json.dumps(item_dict['Items'], cls=DecimalEncoder)
    }

def upload_match(uploader, match):
    for round in match['rounds']:
        roundID = str(round['round_start'])
        for player in round['players']:
            upload_player_round_attributes(roundID, match, round, player)
    return 

def upload_upload_record(uploader, match):
    item = {
        'pk': 'USER#' + str(uploader),
        'sk': 'UPLOAD#' + str(match['match_id'])
    }
    table.put_item(Item=item)
    return

def upload_player_round_attributes(roundID, match, round, player):
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
        'medals' : player['medals'],
        'round_start' : round['round_start'],
        'round_end' : round['round_end'],
        'round_winning_team' : round['winning_team'],
        'match_type' : match['match_id'],
        'match_classification' : match['match_classification'],
        'match_start' : match['match_start'],
        'match_end' : match['match_end'],
        'map_name' : match['map_name'],
        'map_display_name' : match['map_display_name'],
        'match_winning_team' : match['winning_team'],
        'win_condition' : match['win_conidtion'],
        'client_version' : match['client_version'],
        'co_driver_version' : match['co_driver_version'],
        'host_name' : match['host_name'],
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