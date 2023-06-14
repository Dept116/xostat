import json


def build_response(status_code, message, data=None):
    response = {
        "statusCode": status_code,
        "headers": {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
        },
        "body": json.dumps({"message": message, "data": data})
    }
    return response


def build_upload_response(match_list):
    response = {
        "statusCode": 200,
        "headers": {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
        },
        "body": json.dumps({"uploaded_matches": match_list, "uploaded_builds": 0})
    }
    return response
