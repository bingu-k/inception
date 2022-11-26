FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    mkdir -p /var/www/html/wordpress /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/sites-available/default

RUN openssl req -x509 -nodes \
    -newkey rsa:2048 \
    -subj "/C=KR/ST=Seoul/L=Gang-nam/O=42seoul/OU=Kim/CN=byeukim" \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]