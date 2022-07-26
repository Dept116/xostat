from ast import Expression
import json
import boto3
import os
from boto3.dynamodb.conditions import Key

dynamodb = boto3.resource('dynamodb')

TABLE_NAME = os.environ['DYNAMODB_TABLE']
table = dynamodb.Table(TABLE_NAME)

class Stats:
    def __init__(self):
        self.rounds = 0
        self.kills = 0
        self.deaths = 0
        self.assists = 0
        self.drone_kills = 0
        self.damage = 0
        self.cabin_damage = 0
        self.damage_recieved = 0

    def __init__(self, json):
        self.rounds = 1
        self.kills = json.get('rounds', 0)
        self.deaths = json.get('deaths', 0)
        self.assists = json.get('assists', 0)
        self.drone_kills = json.get('drone_kills', 0)
        self.damage = json.get('damage', 0)
        self.cabin_damage = json.get('cabin_damage', 0)
        self.damage_recieved = json.get('damage_recieved', 0)

    def __add__(self, other):
        self.rounds += other.rounds
        self.games += other.games
        self.kills += other.kills
        self.deaths += other.deaths
        self.assists += other.assists
        self.drone_kills += other.drone_kills
        self.damage += other.damage
        self.cabin_damage += other.cabin_damage
        self.damage_recieved += other.damage_recieved

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
    mvp = 0
    stats = Stats()

    for round in userRounds['Items']:
        stats += Stats(round)
        if round['nickname'] not in nicknames:
            nicknames.append(round['nickname'])
        if round['match_id'] not in games:
            games.append(round['match_id'])
        if round['team'] == round['winning_team']:
            wins += 1
        if 'MvpWin' in round['medals']:
            mvp += 1
        
    item = {
        'nicknames': nicknames,
        'games' : len(games),
        'rounds' : stats.rounds,
        'wins' : stats.wins,
        'kills' : stats.kills,
        'assists' : stats.assists,
        'deaths' : stats.deaths,
        'damage' : stats.damage,
        'cabin_damage' : stats.cabin_damage,
        'damage_recieved' : stats.damage_recieved,
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