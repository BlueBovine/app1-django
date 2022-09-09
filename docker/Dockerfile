FROM frolvlad/alpine-python2
COPY requirements.txt docker/start.sh /
RUN apk update ; \
  apk add --no-cache --virtual .build-deps postgresql-dev gcc python2-dev musl-dev ; \
  apk add --no-cache sed mariadb-connector-c-dev ; \
  pip install -r /requirements.txt ; \
  apk del .build-deps ; \
  chmod +x start.sh
COPY notejam /notejam
EXPOSE 8000
ENTRYPOINT ["sh", "start.sh"]
