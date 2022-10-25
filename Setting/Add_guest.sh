# Repository 인덱스 업데이트
sudo apt-get update

# 커널 모듈을 빌드하기 위한 패키지 설치 (uname -r은 커널의 버전을 의미)
sudo apt-get install -y build-essential dkms linux-headers-$(uname -r)

# 광학 이미지를 Mount 하기 위한 디렉토리 생성
sudo mkdir -p /mnt/cdrom

# 광학 이미지를 Mount
sudo mount /dev/cdrom /mnt/cdrom

# Mount된 디렉토리로 이동
cd /mnt/cdrom

# Guest Image의 실행 파일을 직접 실행 (nox11은 xterm 화면이 나타나지 않도록 설정)
sudo sh ./VBoxLinuxAdditions.run —nox11
