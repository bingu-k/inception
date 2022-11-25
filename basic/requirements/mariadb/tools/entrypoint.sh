#!/bin/sh

chown -R 777 /var/lib/mysql/

chown -R mysql:mysql /var/lib/mysql/

if [ ! -f "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    service mysql start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" && \
    mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" && \
    mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" && \
    mysql -e "FLUSH PRIVILEGES;" && \
    sleep 1 && \
    mysql -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" && \
    mysql -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;" && \
    mysql $MYSQL_DATABASE -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD && \
    mysqladmin -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD shutdown;
fi

exec mysqld