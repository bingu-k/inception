# Nginx 컨테이너 접근
docker-compose exec nginx /bin/bash

# Nginx 패키지 설치
apt-get update -y && apt-get upgrade -y && apt-get -y install nginx openssl vim

# Openssl 인증서 만들기
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt

Generating a RSA private key
..+++++
..................................................................................................+++++
writing new private key to '/etc/ssl/certs/server_pkey.pem'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:
State or Province Name (full name) [Some-State]:
Locality Name (eg, city) []:
Organization Name (eg, company) [Internet Widgits Pty Ltd]:
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:
Email Address []:

# default 파일 수정
vim /etc/nginx/sites-available/default
# server {
#	listen 443 ssl;
#	ssl_protocols  TLSv1.2 TLSv1.3;
#    
#	ssl_certificate /etc/ssl/certs/server.crt;
#	ssl_certificate_key /etc/ssl/private/server_pkey.pem;
#
#	root /var/www/html;
#
#	index index.php index.html index.htm;
#
#	server_name _;
#
#	location / {
#		try_files $uri $uri/ =404;
#	}
#
#	location ~ \.php$ {
#		include snippets/fastcgi-php.conf;
#        
#		# fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
#		fastcgi_param SCRIPT_FILENAME /var/www/html/$fastcgi_script_name;
#		fastcgi_pass 172.25.0.2:9000;
#	}
#}

# Nginx 시작
service nginx start


