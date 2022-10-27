if [ ! -d "/var/lib/mysql/${MARIADB_DB}" ]
then
	service mysql start;

	mysql -u ${MYSQL_ROOT} -e "CREATE DATABASE ${MARIADB_DB};"

	mysql -u ${MYSQL_ROOT} -e "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PWD}';"
	mysql -u ${MYSQL_ROOT} -e "GRANT ALL PRIVILEGES ON ${MARIADB_DB}.* TO '${MARIADB_USER}'@'%';"

	mysql -u ${MYSQL_ROOT} -e "FLUSH PRIVILEGES;"
	
	mysql -u ${MYSQL_ROOT} -e "ALTER USER '${MYSQL_ROOT}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

	service mysql stop;
else
	echo "\tAlready exists DB";
fi

mysqld;
