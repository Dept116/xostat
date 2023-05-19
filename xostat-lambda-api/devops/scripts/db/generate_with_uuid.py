import os
import yaml
import subprocess

def clean():
    with open("../serverless.yml", 'r') as stream:
        try:
            config = yaml.safe_load(stream)

            database = config['custom']['dev']['DB_NAME']
            user = config['custom']['dev']['DB_USER']
            password = config['custom']['dev']['DB_PASSWORD']
            host = config['custom']['dev']['DB_HOST']
            port = config['custom']['dev']['DB_PORT']

            container = "xodat"
            os.environ['PGPASSWORD'] = password

            commands = [
                ["docker", "exec", container, "dropdb", "-U", user, database],
                ["docker", "exec", container, "createdb", "-U", user, database],
                ["docker", "cp", "./scripts/sql/generate_with_uuid.sql", f"{container}:/"],
                ["docker", "exec", container, "psql", "-U", user, "-d", database, "-f", "/generate_with_uuid.sql"]
            ]

            for command in commands:
                result = subprocess.run(command, capture_output=True, text=True)
                if result.returncode != 0:
                    print(f"Command '{' '.join(command)}' failed with error:\n{result.stderr}")
                    break
                else:
                    print(f"Command '{' '.join(command)}' succeeded with output:\n{result.stdout}")

            print("Tables generate_with_uuid successfully")

        except yaml.YAMLError as exc:
            print(exc)
        except subprocess.CalledProcessError as e:
            print("Failed to setup tables:", str(e))

if __name__ == "__main__":
    clean()