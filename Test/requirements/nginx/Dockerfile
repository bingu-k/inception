FROM debian:buster

MAINTAINER byeykim

RUN apt-get update && apt-get install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/sites-available/default

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -subj "/C=KR/ST=Seoul/L=Gang-nam/O=42seoul/OU=Kim/CN=byeukim" -keyout /etc/nginx/ssl/private/nginx.key -out /etc/nginx/ssl/certs/nginx.pem

CMD ["nginx", "-g", "daemon off;"]
