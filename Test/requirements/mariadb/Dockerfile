FROM debian:buster

LABEL author byeukim

RUN apt-get -y update  && apt-get -y upgrade
RUN apt-get install -y mariadb-server
RUN	mkdir -p /var/lib/mysql /var/run/mysqld
RUN	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
RUN	chmod 777 /var/run/mysqld

COPY tools/conf.sh ./

ENTRYPOINT  ["sh", "./conf.sh"]
