# docker-compose 명령어로 mariadb 컨테이너에 접근하기.
docker-compose exec mariadb /bin/bash

# mariadb-server 설치 및 시작
apt-get update -y && apt-get upgrade -y && apt-get -y install mariadb-server

apt-get install -y vim
vim /etc/mysql/mariadb.conf.d/50-server.cnf
# bind-address를 주석처리한다. (외부 ip에서 접근할 수 없게함)

# 시작.
service mysql start

# wordpress에서 사용할 유저, DB생성
mysql #(접근)

# DATABASE 생성
CREATE DATABASE <DB_NAME>;

# USER 생성, 권한 설정
CREATE USER '<USERNAME>'@'%' IDENTIFIED BY '<PASSWORD>';
GRANT ALL ON <DB_NAME>.* TO '<USERNAME>'@'%';
FLUSH PRIVILEGES;

# 종료후 ip 확인
exit
hostname -i
exit

# wordpress에서 mariadb-client install
docker-compose exec wordpress /bin/bash

apt-get update -y && apt-get upgrade -y && apt-get -y install mariadb-client

mysql -u <USERNAME> -ppassword -h <hostname -i에서 확인한 ip>
