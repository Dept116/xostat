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
$ serverless deploy --stage prod
```
