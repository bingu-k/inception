FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    mkdir -p /var/www/html/wordpress && \
    apt-get install -y wget php-fpm && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp && \

# wp-cli.phar의 권한(-rw-r--r--) -> "chmod +x wp-cli.phar" -> -rwxr-xr-x
# mv wp-cli.phar /usr/bin/wp로 옮겨줘야 wp명령어로 사용가능하다.