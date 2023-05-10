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
