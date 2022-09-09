#!/bin/sh

## Replace database conecction stuff
sed -i "s/_DOCKER_REPLACE_DB_NAME_/${DB_NAME}/g" /notejam/notejam/settings.py
sed -i "s/_DOCKER_REPLACE_DB_USER_/${DATABASE_USER}/g" /notejam/notejam/settings.py
sed -i "s/_DOCKER_REPLACE_DB_PASSWORD_/${DATABASE_PASSWORD}/g" /notejam/notejam/settings.py
sed -i "s/_DOCKER_REPLACE_DB_HOST_/${DB_ENDPOINT}/g" /notejam/notejam/settings.py
sed -i "s/_DOCKER_REPLACE_DB_PORT_/${DB_PORT}/g" /notejam/notejam/settings.py

cd /notejam
## Update the database
./manage.py syncdb
./manage.py migrate

## Run the server
./manage.py runserver 0.0.0.0:8000

