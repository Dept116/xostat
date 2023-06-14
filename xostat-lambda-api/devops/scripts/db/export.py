import os
import yaml
import subprocess

def drop_tables():
    with open("../serverless.yml", 'r') as stream:
        try:
            config = yaml.safe_load(stream)
            database = config['custom']['dev']['DB_NAME']
            user = config['custom']['dev']['DB_USER']
            password = config['custom']['dev']['DB_PASSWORD']
            host = config['custom']['dev']['DB_HOST']
            port = config['custom']['dev']['DB_PORT']

            os.environ['PGPASSWORD'] = password

            subprocess.run(['docker', 'exec', '-it', 'xodat', 'bash', '-c', 'pg_dump -U dev -d xodat --inserts --clean --create > /setup.sql'], check=True)
            subprocess.run(['docker', 'exec', '-it', 'xodat', 'bash', '-c', 'pg_dump -U dev -d xodat --clean --create --schema-only > /clean.sql'], check=True)

            subprocess.run(['docker', 'cp', 'xodat:/setup.sql', './scripts/sql/setup.sql'], check=True)
            subprocess.run(['docker', 'cp', 'xodat:/clean.sql', './scripts/sql/clean.sql'], check=True)

            print("Xodat backed up successfully")

        except yaml.YAMLError as exc:
            print(exc)
        except subprocess.CalledProcessError as e:
            print("Failed to setup tables:", str(e))

if __name__ == "__main__":
    drop_tables()