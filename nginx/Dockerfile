FROM debian:buster

RUN apt-get update -y && apt-get install -y nginx

RUN rm -fr /var/www/html/*

COPY ./index.html /var/www/html

WORKDIR /etc/nginx

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80