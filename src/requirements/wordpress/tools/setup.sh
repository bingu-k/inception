#!/bin/sh

chown -R www-data:www-data /var/www/
# nginx에서 접근할 수 있게 권한 설정

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g" /etc/php/7.3/fpm/pool.d/www.conf;
# 9000 포트를 모든 ip에 연다.

if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
    wp --allow-root --path=/var/www/html/wordpress \
		core download \
        --locale=en_US && \
    # wp core 다운로드한다.
    # ko_KR로 설치, 경로지정, 루트로 실행되는 컨테이너에서 권한을 허용하겠다.
    wp --allow-root --path=/var/www/html/wordpress \
		core config \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=$WP_HOST &&\
    # wp의 config파일을 만들어주기 위함이다.(mariadb-client 필요)
    # sh: 1: /usr/sbin/sendmail: not found (sendmail 필요)
    # 이때 wp-config.php 생성된다.
    wp --allow-root --path=/var/www/html/wordpress \
		core install \
        --url=$DOMAIN \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL && \
    # wp의 관리자를 생성하고 db 설치해준다.(mariadb 연결)
    # function trailingslashit()에 대한 에러(php-mysql 필요)
    # mail 에러가 생긴다면(php-mail 필요)
    wp --allow-root --path=/var/www/html/wordpress \
		user create $WP_USER $WP_EMAIL \
        --role=author \
        --user_pass=$WP_USER_PASSWORD && \
    # wp 유저를 생성해준다.
    wp --allow-root --path=/var/www/html/wordpress \
        theme activate twentytwentytwo
	# twentytwentytwo 테마 활성화
fi

echo "
WordPress Start!
";

exec /usr/sbin/php-fpm7.3 -F