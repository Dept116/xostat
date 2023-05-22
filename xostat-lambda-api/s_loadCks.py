import serverless_sdk
sdk = serverless_sdk.SDK(
    org_id='xostat',
    application_name='xostat-lambda-api',
    app_uid='000000000000000000',
    org_uid='000000000000000000',
    deployment_uid='undefined',
    service_name='xostat-lambda-api',
    should_log_meta=False,
    should_compress_logs=True,
    disable_aws_spans=False,
    disable_http_spans=False,
    stage_name='dev',
    plugin_version='6.2.2',
    disable_frameworks_instrumentation=False,
    serverless_platform_stage='prod'
)
handler_wrapper_kwargs = {'function_name': 'xostat-lambda-api-dev-loadCks', 'timeout': 6}
try:
    user_handler = serverless_sdk.get_user_handler('python/controllers/cks.load_cks')
    handler = sdk.handler(user_handler, **handler_wrapper_kwargs)
except Exception as error:
    e = error
    def error_handler(event, context):
        raise e
    handler = sdk.handler(error_handler, **handler_wrapper_kwargs)
