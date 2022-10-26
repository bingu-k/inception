sed -i "s/.*bind-address\s.*/bind-address=0.0.0.0\nport=3306/g" /etc/mysql/mariadb.conf.d/50-server.cnf

mysql -u root -e "CREATE DATABASE ${MARIADB_DB};"
mysql -u root -e "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PWD}';"
mysql -u root -e "GRANT ALL ON ${MARIADB_DB}.* TO '${MARIADB_USER}'@'%';"
mysql -u root -e "ALTER USER '${MARIADB_ADMIN}'@'localhost' IDENTIFIED BY '${MARIADB_ADMIN_PWD}'";
mysql -u root -e "FLUSH PRIVILEGES;"

exec mysqld
