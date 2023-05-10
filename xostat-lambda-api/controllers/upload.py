import sys
import json
import datetime
import os

from decimal import *
from models.response import *
from models.builds import *
from .profile import find_uploads_for_user_id
from lib.item_definitions import get_item_dict


def upload_matches(data, context):
    body = json.loads(data.get('body'))
    uploader = body.get('uploader_uid')
    if uploader is None:
        return build_response(500, "Invalid uid, upload aborted")

    uploader = int(uploader)

    upload_build_list(body.get('build_list', []))
    # process_matches(body.get('match_list', []), uploader)

    return build_response(200, "Data fetched successfully", json.dumps(find_uploads_for_user_id(uploader)))

# def process_matches(match_list, uploader):
#     uploaded_matches = set(find_uploads_for_user_id(
#         uploader)['uploaded_matches'])
#     for match in match_list:
#         if match['match_id'] not in uploaded_matches:
#             upload_upload_record(batch, match, uploader)
#             process_rounds(batch, match)


# def process_rounds(batch, match):
#     players = {}
#     for round in match['rounds']:
#         for player in round['players']:
#             if player['uid'] in players:
#                 players[player['uid']].add_round(round, player)
#             else:
#                 players[player['uid']] = player_match(match, round, player)

#     for p in players.values():
#         batch.put_item(replace_float(p.db_item()))

# def queue_player_round_attributes(match, round, player):
#     item = {
#         'pk': 'ROUND#' + str(round['round_start']),
#         'sk': 'USER#' + str(player['uid']),
#         'match_id' : player['match_id'],
#         'round_id' : round['round_id'],
#         'bot' : player['bot'],
#         'nickname' : player['nickname'],
#         'team' : player['team'],
#         'build_hash' : player['build_hash'],
#         'power_score' : player['power_score'],
#         'kills' : player['kills'],
#         'assists' : player['assists'],
#         'drone_kills' : player['drone_kills'],
#         'deaths' : player['deaths'],
#         'score' : player['score'],
#         'damage' : str(player['damage']),
#         'damage_taken' : str(player['damage_taken']),
#         'scores' : player['scores'],
#         'medals' : player['medals'],
#         'round_start' : round['round_start'],
#         'round_end' : round['round_end'],
#         'round_winning_team' : round['winning_team'],
#         'match_type' : match['match_type'],
#         'match_classification' : match['match_classification'],
#         'match_start' : match['match_start'],
#         'match_end' : match['match_end'],
#         'map_name' : match['map_name'],
#         'map_display_name' : match['map_display_name'],
#         'match_winning_team' : match['winning_team'],
#         'win_condition' : match['win_conidtion'],
#         'client_version' : match['client_version'],
#         'co_driver_version' : match['co_driver_version'],
#         'host_name' : match['host_name'],
#         'resources' : match['resources']
#     }
#     queue.append(item)
#     return

# def build_activity_records(match):
#     month = datetime.datetime.strptime(match['match_start'], '%Y-%m-%dT%H:%M:%S.%fZ').replace(day=1, hour=0, minute=0, second=0, microsecond=0)

#     p = []
#     for round in match['rounds']:
#         for player in round['players']:
#             if player['uid'] not in p and player['bot'] == 0:
#                 p.append(player['uid'])

#     if not any(x for x in activity if x.match_type == match['match_type'] and x.month == month):
#         activity.append(xo_activity(month, match['match_type'], match['match_classification']))

#     rec = next ((x for x in activity if x.match_type == match['match_type'] and x.month == month))
#     rec.uploads += 1
#     rec.players += len(p)
#     return


# def build_player_profile(match, round, player, uploader, player_profiles):
#     if player['uid'] in player_profiles:
#         profile = player_profiles[player['uid']]
#         profile.games += 1
#         profile.rounds += 1
#         profile.duration += (datetime.datetime.strptime(round['round_end'], '%Y-%m-%dT%H:%M:%S.%fZ') - datetime.datetime.strptime(
#             round['round_start'], '%Y-%m-%dT%H:%M:%S.%fZ')).total_seconds()
#         profile.kills += player['kills']
#         profile.assists += player['assists']
#         profile.drone_kills += player['drone_kills']
#         profile.deaths += player['deaths']
#         profile.score += player['score']
#         profile.damage += player['damage']
#         profile.damage_recieved += player['damage_taken']

#         if player['nickname'] not in profile.nicknames:
#             profile.nicknames.append(player['nickname'])

#         if player['kills'] > profile.max_kills:
#             profile.max_kills = player['kills']
#         if player['assists'] > profile.max_assists:
#             profile.max_assists = player['assists']
#         if player['drone_kills'] > profile.max_drone_kills:
#             profile.max_drone_kills = player['drone_kills']
#         if player['deaths'] > profile.max_deaths:
#             profile.max_deaths = player['deaths']
#         if player['score'] > profile.max_score:
#             profile.max_score = player['score']
#         if player['damage'] > profile.max_damage:
#             profile.max_damage = player['damage']
#         if player['damage_taken'] > profile.max_damage_recieved:
#             profile.max_damage_recieved = player['damage_taken']

#         if round['round_id'] == 0:
#             if int(uploader) == int(player['uid']):
#                 profile.uploads += 1

#             if match['winning_team'] == -1 or player['team'] <= 0:
#                 profile.unfinished += 1
#             elif match['winning_team'] == 0:
#                 profile.draws += 1
#             elif match['winning_team'] == player['team']:
#                 profile.wins += 1
#             else:
#                 profile.losses += 1

#         if round['winning_team'] == -1 or player['team'] <= 0:
#             profile.round_unfinished += 1
#         elif round['winning_team'] == 0:
#             profile.round_draws += 1
#         elif round['winning_team'] == player['team']:
#             profile.round_wins += 1
#         else:
#             profile.round_losses += 1
#     else:
#         profile = player_profile()
#         profile.uid = player['uid']
#         profile.nicknames.append(player['nickname'])
#         profile.uploads = 0
#         profile.games = 1
#         profile.rounds = 1
#         profile.duration = (datetime.datetime.strptime(round['round_end'], '%Y-%m-%dT%H:%M:%S.%fZ') - datetime.datetime.strptime(
#             round['round_start'], '%Y-%m-%dT%H:%M:%S.%fZ')).total_seconds()
#         profile.wins = 0
#         profile.losses = 0
#         profile.draws = 0
#         profile.unfinished = 0
#         profile.round_wins = 0
#         profile.round_losses = 0
#         profile.round_draws = 0
#         profile.round_unfinished = 0
#         profile.kills = player['kills']
#         profile.assists = player['assists']
#         profile.drone_kills = player['drone_kills']
#         profile.deaths = player['deaths']
#         profile.score = player['score']
#         profile.damage = player['damage']
#         profile.damage_recieved = player['damage_taken']
#         profile.max_kills = player['kills']
#         profile.max_assists = player['assists']
#         profile.max_drone_kills = player['drone_kills']
#         profile.max_deaths = player['deaths']
#         profile.max_score = player['score']
#         profile.max_damage = player['damage']
#         profile.max_damage_recieved = player['damage_taken']

#         if round['round_id'] == 0:
#             if int(uploader) == int(player['uid']):
#                 profile.uploads = 1

#             if match['winning_team'] == -1 or player['team'] <= 0:
#                 profile.unfinished = 1
#             elif match['winning_team'] == 0:
#                 profile.draws = 1
#             elif match['winning_team'] == player['team']:
#                 profile.wins = 1
#             else:
#                 profile.losses = 1

#         if round['winning_team'] == -1 or player['team'] <= 0:
#             profile.round_unfinished = 1
#         elif round['winning_team'] == 0:
#             profile.round_draws = 1
#         elif round['winning_team'] == player['team']:
#             profile.round_wins = 1
#         else:
#             profile.round_losses = 1

#         player_profiles[player['uid']] = profile


# def queue_player_profiles():
#     for player in player_profiles.values():
#         pk = Key('sk').eq('PROFILE#ALL')
#         sk = Key('pk').eq('USER#' + str(player.uid))
#         expression = pk & sk

#         profile = table.query(
#             IndexName='sk-pk-index',
#             KeyConditionExpression=expression,
#         )

#         if 'Item' in profile:
#             profile = profile['Item']

#         item = {
#             'pk': 'USER#' + str(player.uid),
#             'sk': 'PROFILE#ALL',
#             'uploads': profile.get('uploads', 0) + player.uploads,
#             'games': profile.get('games', 0) + player.games,
#             'rounds': profile.get('rounds', 0) + player.rounds,
#             'duration': profile.get('duration', 0) + player.duration,
#             'wins': profile.get('wins', 0) + player.wins,
#             'losses': profile.get('losses', 0) + player.losses,
#             'draws': profile.get('draws', 0) + player.draws,
#             'unfinished': profile.get('unfinished', 0) + player.unfinished,
#             'round_wins': profile.get('round_wins', 0) + player.round_wins,
#             'round_losses': profile.get('round_losses', 0) + player.round_losses,
#             'round_draws': profile.get('round_draws', 0) + player.round_draws,
#             'round_unfinished': profile.get('round_unfinished', 0) + player.round_unfinished,
#             'kills': profile.get('kills', 0) + player.kills,
#             'assists': profile.get('assists', 0) + player.assists,
#             'drone_kills': profile.get('drone_kills', 0) + player.drone_kills,
#             'deaths': profile.get('deaths', 0) + player.deaths,
#             'score': profile.get('score', 0) + player.score,
#             'damage': profile.get('damage', 0) + player.damage,
#             'damage_recieved': profile.get('damage_recieved', 0) + player.damage_recieved,
#             'max_kills': max(player.max_kills, profile.get('max_kills', 0)),
#             'max_assists': max(player.max_assists, profile.get('max_assists', 0)),
#             'max_drone_kills': max(player.max_drone_kills, profile.get('max_drone_kills', 0)),
#             'max_deaths': max(player.max_deaths, profile.get('max_deaths', 0)),
#             'max_damage': max(player.max_damage, profile.get('max_damage', 0)),
#             'max_damage_recieved': max(player.max_damage_recieved, profile.get('max_damage_recieved', 0)),
#             'max_score': max(player.max_score, profile.get('max_score', 0))
#         }
#         # queue.append(item)
#     return

# def queue_activity_records():
#     for a in activity:
#         pk = Key('pk').eq('ACTIVITY#' + str(a.match_type))
#         sk = Key('sk').eq('MONTH#' + str(a.month))
#         expression = pk & sk

#         rec = table.query(
#             KeyConditionExpression= expression,
#         )

#         if 'Item' in rec:
#             rec = rec['Item']

#         item = {
#             'pk': 'ACTIVITY#' + str(a.match_type),
#             'sk': 'MONTH#' + str(a.month),
#             'uploads' : a.uploads + rec.get('uploads', 0),
#             'players' : a.players + rec.get('players', 0)
#         }
#         queue.append(item)
#     return


# def upload_build(build):
#     pk_value = 'BUILD#' + str(build['build_hash'])
#     sk_value = 'POWER_SCORE#' + str(build['power_score'])

#     existing_build = table.get_item(
#         Key={'pk': pk_value, 'sk': sk_value}, ConsistentRead=False)
#     existing_parts = existing_build.get('Item', {}).get('parts', [])
#     new_parts = build['parts']

#     combined_parts = list(set(existing_parts) | set(new_parts))

#     item = {
#         'pk': 'BUILD#' + str(build['build_hash']),
#         'sk': 'POWER_SCORE#' + str(build['power_score']),
#         'parts': combined_parts
#     }
#     batch.put_item(item)


# def upload_upload_record(batch, match, uploader):
#     item = {
#         'pk': f'USER#{uploader}',
#         'sk': f'UPLOAD#{match["match_id"]}',
#     }
#     batch.put_item(item)
