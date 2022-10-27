#!/bin/bash

mysql -e "CREATE DATABASE ${MARIADB_DB};"

mysql -e "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PWD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MARIADB_DB}.* TO '${MARIADB_USER}'@'%';"

mysql -e "UPDATE mysql.user SET Password = PASSWORD('${MARIADB_ROOT_PASSWORD}') WHERE User = '${MARIADB_ROOT}';"

mysql -e "FLUSH PRIVILEGES;"

service mysql start
