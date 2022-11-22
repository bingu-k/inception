FROM debian:buster

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y mariadb-server \
	&& echo "\ndaemon off;" >> /etc/mysql/mariadb.cnf

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["bash", "entrypoint.sh"];

EXPOSE 3306