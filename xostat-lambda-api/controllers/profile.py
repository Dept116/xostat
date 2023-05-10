import os
import json

from decimal import *
from models.response import *
from models.uploads import get_uploads_by_user
from sqlalchemy.exc import SQLAlchemyError


def get_upload_records(event, context):
    try:
        userID = event['pathParameters']['id']
        if not userID.isdigit():
            return build_response(400, "'id' must be a number.")

        upload_records = get_uploads_by_user(userID)
        return build_response(200, "Data fetched successfully", upload_records)

    except KeyError:
        return build_response(400, "'id' must be provided in the path parameters.")
    except SQLAlchemyError as e:
        return build_response(500, f"Internal Server Error: {str(e)}")


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
        KeyConditionExpression=expression,
    )

    player_stats = stats()
    for round in userRounds['Items']:
        player_stats.add_round(round)

    item = {
        'nicknames': player_stats.nicknames,
        'games': player_stats.games,
        'rounds': player_stats.rounds,
        'wins': player_stats.game_wins,
        'kills': player_stats.kills,
        'assists': player_stats.assists,
        'deaths': player_stats.deaths,
        'damage': player_stats.damage,
        'damage_recieved': player_stats.damage_recieved,
        'mvp': player_stats.game_mvp
    }

    return json.dumps(item, cls=DecimalEncoder)
