### Dependencies

Install the serverless framework

```bash
npm install -g serverless
```

Python 3.8, see python/README.md
rust, see rust/README.md

### Local development

Please follow the steps described in devops/README.md for local configuration.

Once configured the api can be started with

```bash
serverless offline
```

### Deployment

```
serverless deploy --stage prod
```

### Scheduled Jobs

Functions can be scheduled with cron syntax as below

```
  loadCks:
    handler: python/controllers/cks.load_cks
    events:
      - schedule: cron(30 8 * * ? *)
```

They can be manually invoked from the command line

```bash
aws lambda invoke --function-name your-function-name
```

Or locally with

```bash
sls invoke local --function-name your-function-name
```
