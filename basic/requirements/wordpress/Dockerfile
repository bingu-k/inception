FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    mkdir -p /var/www/html/wordpress /run/php && \
    apt-get install -y wget php7.3-fpm php7.3-mysql php-mail mariadb-client && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

# wp-cli.phar의 권한(-rw-r--r--) -> "chmod +x wp-cli.phar" -> -rwxr-xr-x
# mv wp-cli.phar /usr/bin/wp로 옮겨줘야 wp명령어로 사용가능하다.

# wp core download --locale=ko_KR --path=/var/www/html/wordpress --allow-root
# wp core를 다운로드하는데 ko_KR로 설치, 경로지정, 루트로 실행되는 컨테이너에서 권한을 허용하겠다는 내용.

COPY ./tools/setup.sh /tmp
RUN chmod +x /tmp/setup.sh

ENTRYPOINT [ "bash", "/tmp/setup.sh" ]

EXPOSE 9000