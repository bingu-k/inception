# 사용자 전환
# su -

# Repository 인덱스 업데이트
apt-get update

# sudo 설치
apt-get install -y sudo

# 패키지 관리자가 https를 이용할 수 있도록 설정
sudo apt-get install -y apt-transport-https

# SSL 통신이 가능하도록 CA (Certificate Authorities)로부터 인증서를 획득
sudo apt-get install -y ca-certificates

# 다양한 통신 프로토콜을 지원하는 데이터 송,수신 패키지
sudo apt-get install -y curl make

# Repository를 추가 및 삭제할 수 있도록 설정하는 패키지
sudo apt-get install -y software-properties-common

# openssl s_client -connect localhost:443 -tls1_3 //TLS1.3 확인
# openssl s_client -connect localhost:443 -tls1_2 //TLS1.2 확인
# VM 에서 확인하기!

# 크롬으로 http 접근 가능한지 확인위한 설치
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
