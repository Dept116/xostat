import json
import boto3
import os

from decimal import *
from classes.player_stats import *
from classes.decoder import *
from ast import Expression
from boto3.dynamodb.conditions import Key

dynamodb = boto3.resource('dynamodb')

TABLE_NAME = os.environ['DYNAMODB_TABLE']
table = dynamodb.Table(TABLE_NAME)

def get_user_names(event, context):
    return ""

def get_match_history(event, context):
    return ""

def get_user_totals(event, context):
    userID = event['pathParameters']['id']

    pk = Key('pk').eq('USER#' + str(userID))
    sk = Key('sk').eq('PROFILE#ALL')
    expression = pk & sk

    userTotals = table.query(
        KeyConditionExpression=expression
    )

    return {
        "statusCode": 200,
        "headers": {"Access-Control-Allow-Origin": "*"},
        "body": json.dumps(userTotals['Items'], cls=DecimalEncoder)
    }

def get_user_totals_from_history(event, context):
    userID = event['pathParameters']['id']

    pk = Key('sk').eq('USER#' + str(userID))
    sk = Key('pk').begins_with('ROUND#')
    expression = pk & sk

    userRounds = table.query(
        IndexName='sk-pk-index',
        KeyConditionExpression= expression,
    )

    player_stats = stats()
    for round in userRounds['Items']:
        player_stats.add_round(round)
        
    item = {
        'nicknames': player_stats.nicknames,
        'games' : player_stats.games,
        'rounds' : player_stats.rounds,
        'wins' : player_stats.game_wins,
        'kills' : player_stats.kills,
        'assists' : player_stats.assists,
        'deaths' : player_stats.deaths,
        'damage' : player_stats.damage,
        'cabin_damage' : player_stats.cabin_damage,
        'damage_recieved' : player_stats.damage_recieved,
        'mvp' : player_stats.game_mvp
    }

    return json.dumps(item, cls=DecimalEncoder)

def get_upload_records(event, context):
    userID = event['pathParameters']['id']
    previouslyUploadedMatches = find_uploads_for_user_id(userID)

    return {
        "statusCode": 200,
        "headers": {"Access-Control-Allow-Origin": "*"},
        "body": json.dumps(previouslyUploadedMatches)
    }

def find_uploads_for_user_id(uploader):
    matches = []

    pk = Key('pk').eq('USER#' + str(uploader))
    sk = Key('sk').begins_with('UPLOAD#')
    expression = pk & sk

    uploadRecords = table.query(
        KeyConditionExpression=expression
    )

    for match in uploadRecords.get('Items'):
        matches.append(int(match.get('sk', 0).strip('UPLOAD#')))
    
    return {'uploaded_matches' : matches,
            'uploaded_builds' : 0}
