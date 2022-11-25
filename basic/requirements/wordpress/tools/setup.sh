#!/bin/sh

sleep 4

if [ ! -f "/var/www/html/wordpress/index.php" ]; then
    wp core download --allow-root \
        --locale=ko_KR \
        --path=/var/www/html/wordpress && \
    # wp core 다운로드한다.
    # ko_KR로 설치, 경로지정, 루트로 실행되는 컨테이너에서 권한을 허용하겠다.
    wp core config --allow-root \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=$WP_HOST \
        --path=/var/www/html/wordpress && \
    # wp의 config파일을 만들어주기 위함이다.(mariadb-client 필요)
    # 이때 wp-config.php 생성된다.
    wp core install --allow-root \
        --url=$DOMAIN \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --path=/var/www/html/wordpress && \
    # wp의 관리자를 생성하고 db 설치해준다.(mariadb 연결)
    # function trailingslashit()에 대한 에러(php-mysql 필요)
    # mail 에러가 생긴다면(php-mail 필요)
    wp user create --allow-root $WP_USER $WP_EMAIL \
        --role=author \
        --path=/var/www/html/wordpress \
        --user_pass=$WP_USER_PASSWORD;
    # wp 유저를 생성해준다.
fi

exec /usr/sbin/php-fpm7.3