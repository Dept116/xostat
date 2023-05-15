### Dependencies

Python 3.8, see python/README.md
rust, see rust/README.md

### Local development

```bash
serverless plugin install -n serverless-offline
serverless plugin install -n serverless-rust
```

After installation, you can start local emulation with:

```
serverless offline
```

### Local PostgreSQL

Pull postgres and run using the following commands in PowerShell to emulate a db.tg4.micro

```bash
docker pull postgres
docker run -d --name xodat -e POSTGRES_USER=dev -e POSTGRES_PASSWORD=devpass1 -e POSTGRES_DB=xodat -p 5432:5432 --cpus=2 --memory=1g -d postgres
```

### Deployment

```
$ serverless deploy --stage prod
```
