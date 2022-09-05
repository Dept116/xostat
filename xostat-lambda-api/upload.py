import json
import boto3
import datetime

from decimal import *
from classes.decoder import *
from classes.player_profile import *
from classes.xo_activity import *
from profile import find_uploaded_matches_for_user_id
from lib.item_definitions import get_item_dict
from boto3.dynamodb.conditions import Key

dynamodb = boto3.resource('dynamodb', region_name="us-east-2")
table = dynamodb.Table('xodat')

queue = []
uploader = 0
players = {}
# builds = {}
activity = []

def upload_matches(event, context):
    uploader = event['uploader_uid']
    previously_uploaded_match = find_uploaded_matches_for_user_id(uploader)
    # item_dict = get_item_dict()

    for build in event['build_list']:
        queue_build(build)

    for match in event['match_list']:
        if match['match_id'] not in previously_uploaded_match:
            queue_upload_record(match)
            build_activity_records(match)
            for round in match['rounds']:
                for player in round['players']:
                    queue_player_round_attributes(match, round, player)
                    build_player_profile(match, round, player)
                    
    queue_player_profiles()
    queue_activity_records()

    # with table.batch_writer(overwrite_by_pkeys=['partition_key', 'sort_key']) as batch:
    #     for i in range(50):

    return {
        'statusCode': 200,
        'headers': {'Access-Control-Allow-Origin': '*'},
        'body': json.dumps(queue, default=vars)
    }

def queue_player_round_attributes(match, round, player):
    item = {
        'pk': 'ROUND#' + str(round['round_start']),
        'sk': 'USER#' + str(player['uid']),
        'match_id' : player['match_id'],
        'round_id' : round['round_id'],
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
        'cabin_damage' : str(player['cabin_damage']),
        'damage_taken' : str(player['damage_taken']),
        'scores' : player['scores'],
        'medals' : player['medals'],
        'round_start' : round['round_start'],
        'round_end' : round['round_end'],
        'round_winning_team' : round['winning_team'],
        'match_type' : match['match_type'],
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
    queue.append(item)
    return

def build_activity_records(match):
    month = datetime.strptime(match['match_start'], '%Y-%m-%dT%H:%M:%S.%fZ').replace(day=0, hour=0, minute=0, second=0, microsecond=0)

    p = []
    for round in match['rounds']:
        for player in round['players']:
            if player['uid'] not in p:
                p.append(player['uid'])

    if any(x for x in activity if x.match_type == match['match_type'] and x.month == month):
        activity.append(xo_activity(month, match['match_type'], match['match_classification']))

    rec = next ((x for x in activity if x.match_type == match['match_type'] and x.month == month))
    rec.uploads += 1
    rec.players += len(p)
    return


def build_player_profile(match, round, player):
    if player['uid'] in players:
        profile = players[player['uid']]
        profile.uploads += 1 if uploader == player['uid'] else 0
        profile.games += 1
        profile.rounds += 1
        profile.duration += (datetime.datetime.strptime(round['round_end'], '%Y-%m-%dT%H:%M:%S.%fZ') -datetime.datetime.strptime(round['round_start'], '%Y-%m-%dT%H:%M:%S.%fZ')).total_seconds()
        profile.kills += player['kills']
        profile.assists += player['assists']
        profile.drone_kills += player['drone_kills']
        profile.deaths += player['deaths']
        profile.score += player['score']
        profile.damage += player['damage']
        profile.cabin_damage += player['cabin_damage']
        profile.damage_recieved += player['damage_taken']

        if player['kills'] >  profile.max_kills:
            profile.max_kills = player['kills']
        if player['assists'] >  profile.max_assists:
            profile.max_assists = player['assists']
        if player['drone_kills'] >  profile.max_drone_kills:
            profile.max_drone_kills = player['drone_kills']
        if player['deaths'] >  profile.max_deaths:
            profile.max_deaths = player['deaths']
        if player['score'] >  profile.max_score:
            profile.max_score = player['score']
        if player['damage'] >  profile.max_damage:
            profile.max_damage = player['damage']
        if player['cabin_damage'] >  profile.max_cabin_damage:
            profile.max_cabin_damage = player['cabin_damage']
        if player['damage_taken'] >  profile.max_damage_recieved:
            profile.max_damage_recieved = player['damage_taken']
        if round['round_id'] == 0:
            if round['winning_team'] == -1 or round['team'] <= 0:
                profile.unfinished += 1
            elif round['winning_team'] == 0:
                profile.draws += 1
            elif round['winning_team'] == round['team']:
                profile.wins += 1
            else:
                profile.losses += 1
        if round['round_winning_team'] == -1 or round['team'] <= 0:
            profile.round_unfinished += 1
        elif round['round_winning_team'] == 0:
            profile.round_draws += 1
        elif round['round_winning_team'] == round['team']:
            profile.round_wins += 1
        else:
            profile.round_losses += 1
    else:
        profile = player_profile()
        profile.uid = player['uid']
        profile.nickname = player['nickname']
        profile.uploads = 1 if uploader == player['uid'] else 0
        profile.games = 1
        profile.rounds = 1
        profile.duration = (datetime.datetime.strptime(round['round_end'], '%Y-%m-%dT%H:%M:%S.%fZ') -datetime.datetime.strptime(round['round_start'], '%Y-%m-%dT%H:%M:%S.%fZ')).total_seconds()
        profile.wins = 0
        profile.losses = 0 
        profile.draws = 0
        profile.unfinished = 0
        profile.round_wins = 0
        profile.round_losses = 0
        profile.round_draws = 0
        profile.round_unfinished = 0
        profile.mmr = 1600
        profile.kills = player['kills']
        profile.assists = player['assists']
        profile.drone_kills = player['drone_kills']
        profile.deaths = player['deaths']
        profile.score = player['score']
        profile.damage = player['damage']
        profile.cabin_damage = player['cabin_damage']
        profile.damage_recieved = player['damage_taken']
        profile.max_kills = player['kills']
        profile.max_assists = player['assists']
        profile.max_drone_kills = player['drone_kills']
        profile.max_deaths = player['deaths']
        profile.max_score = player['score']
        profile.max_damage = player['damage']
        profile.max_cabin_damage = player['cabin_damage']
        profile.max_damage_recieved = player['damage_taken']

        if round['winning_team'] == -1 or round['team'] <= 0:
            profile.unfinished = 1
        elif round['winning_team'] == 0:
            profile.draws = 1
        elif round['winning_team'] == round['team']:
            profile.wins = 1
        else:
            profile.losses = 1

        if round['round_winning_team'] == -1 or round['team'] <= 0:
            profile.round_unfinished = 1
        elif round['round_winning_team'] == 0:
            profile.round_draws = 1
        elif round['round_winning_team'] == round['team']:
            profile.round_wins = 1
        else:
            profile.round_losses = 1

        players.insert(player['uid'], profile)

def queue_player_profiles():
    for player in players:
        pk = Key('sk').eq('PROFILE#ALL')
        sk = Key('pk').eq('USER#' + str(player.uid))

        expression = pk & sk

        profile = table.query(
            IndexName='sk-pk-index',
            KeyConditionExpression= expression,
        )['Item']

        item = {
            'pk': 'USER#' + str(player.uid),
            'sk': 'PROFILE#ALL',
            'uploads' : (profile['uploads'] or 0) + profile.uploads,
            'games' : (profile['games'] or 0) + profile.games,
            'rounds' : (profile['rounds'] or 0) + profile.rounds,
            'duration' : (profile['duration'] or 0) + profile.duration,
            'wins' : (profile['wins'] or 0) + profile.wins,
            'losses' : (profile['losses'] or 0) + profile.losses,
            'draws' : (profile['draws'] or 0) + profile.draws,
            'unfinished' : (profile['unfinished'] or 0) + profile.unfinished,
            'round_wins' : (profile['round_wins'] or 0) + profile.round_wins,
            'round_losses' : (profile['round_losses'] or 0) + profile.round_losses,
            'round_draws' : (profile['round_draws'] or 0) + profile.round_draws,
            'round_unfinished' : (profile['round_unfinished'] or 0) + profile.round_unfinished,
            'mmr' : profile.mmr,
            'kills' : (profile['kills'] or 0) + profile.kills,
            'assists' : (profile['assists'] or 0) + profile.assists,
            'drone_kills' : (profile['drone_kills'] or 0) + profile.drone_kills,
            'deaths' : (profile['deaths'] or 0) + profile.deaths,
            'score' : (profile['score'] or 0) + profile.score,
            'damage' : (profile['damage'] or 0) + profile.damage,
            'cabin_damage' : (profile['cabin_damage'] or 0) + profile.cabin_damage,
            'damage_recieved' : (profile['damage_recieved'] or 0) + profile.damage_recieved,
            'max_kills' : max(player.max_kills, profile['max_kills']),
            'max_assists' : max(player.max_assists, profile['max_assists']),
            'max_drone_kills' : max(player.max_drone_kills, profile['max_drone_kills']),
            'max_deaths' : max(player.max_deaths, profile['max_deaths']),
            'max_damage' : max(player.max_damage, profile['max_damage']),
            'max_cabin_damage' : max(player.max_cabin_damage, profile['max_cabin_damage']),
            'max_damage_recieved' : max(player.max_damage_recieved, profile['max_damage_recieved']),
            'max_score' : max(player.max_score, profile['max_score'])
        }
        queue.append(item)
    return

def queue_activity_records():
    for a in activity:
        pk = Key('pk').eq('ACTIVITY#' + str(a.match_type))
        sk = Key('sk').eq('USER#' + str(build['power_score']))

        expression = pk & sk

        existing_build = table.query(
            KeyConditionExpression= expression,
        )['Item']


        item = {
            'pk': 'ACTIVITY#' + str(build['build_hash']),
            'sk': 'POWER_SCORE#' + str(build['power_score']),
            'parts' : build['parts']
        }
        queue.append(item)
    return

def queue_build(build):
    pk = Key('pk').eq('BUILD#' + str(build['build_hash']))
    sk = Key('sk').eq('USER#' + str(build['power_score']))

    expression = pk & sk

    existing_build = table.query(
        KeyConditionExpression= expression,
    )['Item']

    parts = []
    for part in existing_build['parts']:
        parts.append(part)

    for part in build['parts']:
        if part not in parts:
            parts.append(part)

    item = {
        'pk': 'BUILD#' + str(build['build_hash']),
        'sk': 'POWER_SCORE#' + str(build['power_score']),
        'parts' : build['parts']
    }
    queue.append(item)
    return 

def queue_upload_record(match):
    item = {
        'pk': 'USER#' + str(uploader),
        'sk': 'UPLOAD#' + str(match['match_id'])
    }
    queue.append(item)
    return
