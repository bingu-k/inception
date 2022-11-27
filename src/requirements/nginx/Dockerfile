FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    mkdir -p /var/www/html/wordpress /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/conf.d/

COPY tools/setup.sh /tmp
RUN chmod +x /tmp/setup.sh

RUN openssl req -newkey rsa:2048 -x509 -nodes \
    -subj "/C=KR/ST=Seoul/L=Gang-nam/O=42seoul/OU=Kim/CN=byeukim" \
    -keyout /etc/nginx/ssl/byeukim.42.fr.key \
    -out /etc/nginx/ssl/byeukim.42.fr.crt
# TLS를 사용하기 위한 ssl 인증서 생성

EXPOSE 443

ENTRYPOINT [ "bash", "/tmp/setup.sh" ]