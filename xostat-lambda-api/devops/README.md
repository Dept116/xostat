### Local development

```bash
serverless plugin install -n serverless-offline
serverless plugin install -n serverless-rust
```

### Local PostgreSQL

Pull postgres and run using the following commands in PowerShell to emulate a db.tg4.micro

```bash
docker pull postgres
docker run -d --name xodat -e POSTGRES_USER=dev -e POSTGRES_PASSWORD=devpass1 -e POSTGRES_DB=xodat -p 5432:5432 --cpus=2 --memory=1g -d postgres
```

### Setting up local DB

Once your docker container is up you can build tables and seed the database with

```bash
python scripts/db/setup.py
```

To clean

```bash
python scripts/db/clean.py
```

### Export local DB

To export your local database and regenerate the scripts needed above run the following

```bash
python scripts/db/export.py
```
