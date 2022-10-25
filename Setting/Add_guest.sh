# Repository 인덱스 업데이트
sudo apt-get update

# 커널 모듈을 빌드하기 위한 패키지 설치 (uname -r은 커널의 버전을 의미)
sudo apt-get install -y build-essential dkms linux-headers-$(uname -r)

# 여기서 Devices->Insert Guset Additions CD image.. 클릭해주고 다시실행

# 광학 이미지를 Mount 하기 위한 디렉토리 생성
sudo mkdir -p /mnt/cdrom

# 광학 이미지를 Mount
sudo mount /dev/cdrom /mnt/cdrom

# Guest Image의 실행 파일을 직접 실행 (nox11은 xterm 화면이 나타나지 않도록 설정)
sudo sh /mnt/cdrom/VBoxLinuxAdditions.run —-nox11

# 리부팅
# sudo shutdown -r now

# 커널 모듈 로드 확인
lsmod | grep vboxguest

# 사용자를 sudo 그룹에 추가
#sudo usermod -a -G sudo byeukim

# 사용자를 root 그룹에 추가
#sudo usermod -a -G root byeukim

# VM Setting->Shared Folders에서 공유폴더 shared_dir 경로 지정해서 추가

# 공유폴더 만들기
#sudo mkdir /mnt/share

# 공유폴더 마운트
#sudo mount -t vboxsf shared_dir /mnt/share
