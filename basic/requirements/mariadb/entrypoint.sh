#!/bin/sh

chown -R mysql:mysql /var/lib/mysql
echo "Fuck : 2"
FILE="/var/lib/mysql/$MYSQL_DATABASE"

if [ ! -f "$FILE" ]; then
	echo "Fuck : in1"
	service mysql restart
	sleep 1
	echo "Fuck : in2"
    
	mysql -u ${MYSQL_ROOT} -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE"
    mysql -u ${MYSQL_ROOT} -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
    mysql -u ${MYSQL_ROOT} -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'"
    mysql -u ${MYSQL_ROOT} -e "FLUSH PRIVILEGES"
    mysql -u ${MYSQL_ROOT} -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'"
    mysql -u ${MYSQL_ROOT} -e "FLUSH PRIVILEGES"
    mysql -u ${MYSQL_ROOT} -e $MYSQL_DATABASE -u $MYSQL_ROOT -p $MYSQL_ROOT_PASSWORD
    
	mysqladmin -h localhost -p $MYSQL_ROOT_PASSWORD shutdown
fi

echo "Fuck : 3"
exec service mysql start | myslqd