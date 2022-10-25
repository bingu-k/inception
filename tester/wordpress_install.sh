# wordpress 컨테이너로 접근하기
docker-compose exec wordpress /bin/bash

# wordpress 내부 필요한 package install
apt-get update -y && \
apt-get upgrade -y && \
apt-get -y install \
php7.3 \
php-fpm \
php-cli \
wget \
curl \
php-mysql \
php-mbstring \
php-xml \
sendmail \
vim

# wordpress latest 버전을 다운로드
wget https://wordpress.org/latest.tar.gz && \
tar -xvf latest.tar.gz && \
mv /wordpress/* /var/www/html/ && \
chown -R www-data:www-data /var/www/html && \ 
rm -r /wordpress latest.tar.gz

# 볼륨에 마운트
ls -l /var/www/html/

# config 파일 수정
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
vim /var/www/html/wp-config.php

# DB_NAME, DB_USER, DB_PASSWORD, DB_HOST 변경
	define ( 'DB_NAME', 'wordpress');
	define ( 'DB_USER', 'byeukim');
	define ( 'DB_PASSWORD', 'password');
	define ( 'DB_HOST' , '172.18.0.3');

# php fpm 설정 파일 수정
vim /etc/php/7.3/fpm/pool.d/www.conf
	listen = 0.0.0.0:9000

# hostname -i 로 확인 위의 mariadb의 ip와 살짝 다름
