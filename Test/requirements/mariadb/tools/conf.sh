sed -i "s/.*bind-address\s.*/bind-address=0.0.0.0\nport=3306/g" /etc/mysql/mariadb.conf.d/50-server.cnf

mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DB};"
mysql -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PWD}';"
mysql -e "GRANT ALL ON ${MARIADB_DB}.* TO '${MARIADB_USER}'@'%';"
mysql -e "ALTER USER '${MARIADB_ADMIN}'@'localhost' IDENTIFIED BY '${MARIADB_ADMIN_PWD}'";
mysql -e "FLUSH PRIVILEGES;"

exec mysqld
