from ast import Expression
import json
import boto3
import os
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

    pk = Key('sk').eq('USER#' + str(userID))
    sk = Key('pk').begins_with('ROUND#')
    expression = pk & sk

    userRounds = table.query(
        IndexName='sk-pk-index',
        KeyConditionExpression= expression,
    )

    nicknames = []
    games = []
    rounds = 0
    wins = 0
    kills = 0
    assists = 0
    deaths = 0
    mvp = 0

    for round in userRounds['Items']:
        if round['nickname'] not in nicknames:
            nicknames.append(round['nickname'])
        if round['match_id'] not in games:
            games.append(round['match_id'])
        if round['team'] == round['winning_team']:
            wins += 1
        if 'MvpWin' in round['medals']:
            mvp += 1
        
        kills += int(round['kills'])
        assists += int(round['assists'])
        deaths += int(round['deaths'])
        rounds += 1

    item = {
        'nicknames': nicknames,
        'games' : len(games),
        'rounds' : rounds,
        'wins' : wins,
        'kills' : kills,
        'assists' : assists,
        'deaths' : deaths,
        'mvp' : mvp
    }

    return json.dumps(item)

def get_upload_records(event, context):
    userID = event['pathParameters']['id']
    previouslyUploadedMatches = find_uploaded_matches_for_user_id(userID)

    return {
        "statusCode": 200,
        "headers": {"Access-Control-Allow-Origin": "*"},
        "body": json.dumps(previouslyUploadedMatches)
    }

def find_uploaded_matches_for_user_id(uploader):
    pk = Key('pk').eq('USER#' + str(uploader))
    sk = Key('sk').begins_with('UPLOAD#')
    expression = pk & sk

    uploadRecords = table.query(
        KeyConditionExpression=expression
    )
    
    return uploadRecords['Items']