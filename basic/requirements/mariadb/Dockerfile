FROM debian:buster

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y procps mariadb-server

COPY ./tools/entrypoint.sh /tmp/
RUN chmod +x /tmp/entrypoint.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

ENTRYPOINT  [ "bash", "/tmp/entrypoint.sh" ]

EXPOSE 3306