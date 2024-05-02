From mysql:latest

Env MYSQL_ROOT_PASSWORD=root

COPY ./clubevent.sql /docker-entrypoint-initdb.d
