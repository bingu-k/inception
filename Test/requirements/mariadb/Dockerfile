FROM debian:buster

MAINTAINER byeukim

RUN apt-get -y update
RUN apt-get -y install mariadb-server

COPY tools/conf.sh	.
RUN chmod +x conf.sh

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

ENTRYPOINT  ["bash", "conf.sh"]
