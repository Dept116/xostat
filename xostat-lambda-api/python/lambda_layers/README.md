Any outside dependencies not included by default as part of lambda have to be added here as a layer.

Below are the steps I took to generate a zip for sqlalchemy to upload as a layer, if more are needed just install them into the python directory.

```bash
pip install sqlalchemy -t ./sqlalchemy/python
pip install aws-psycopg2 -t ./sqlalchemy/python
Compress-Archive -Path .\sqlalchemy\* -DestinationPath .\sqlalchemy.zip
aws lambda publish-layer-version --layer-name sqlalchemy-layer --zip-file fileb://sqlalchemy.zip
```
