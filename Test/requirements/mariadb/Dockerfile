FROM debian:buster

MAINTAINER byeukim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y mariadb-server

RUN echo "\ndaemon off;" >> /etc/mysql/mariadb.cnf

COPY tools/conf.sh	.
RUN chmod +x conf.sh

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

ENTRYPOINT  ["bash", "conf.sh"]
