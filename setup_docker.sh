# Docker

PROXY_URL="http://in-proxy.denso.co.jp:8080/"

sudo apt-get update
sudo apt-get install \
     apt-transport-https \
     ca-certificates curl \
     curl \
     gnupg-agent \
     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

#sudo systemctl status docker
#sudo docker ps

#sudo mkdir -p /etc/systemd/system/docker.service.d
#echo "[Service]" | sudo tee -a /etc/systemd/system/docker.service.d/http-proxy.conf
#echo "Environment=\"HTTP_PROXY=${PROXY_URL}\"" | sudo tee -a /etc/systemd/system/docker.service.d/http-proxy.conf
#echo "Environment=\"HTTPS_PROXY=${PROXY_URL}\"" | sudo tee -a /etc/systemd/system/docker.service.d/http-proxy.conf

sudo systemctl daemon-reload
sudo systemctl restart docker

systemctl show --property=Environment docker

# start and autmate docker
sudo systemctl start docker
sudo systemctl enable docker

# docker compose
sudo curl -L https://github.com/docker/compose/releases/download/${compose}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

# user setting
sudo gpasswd -a ${USER} docker

# setup image
sudo docker pull ubuntu:18.04

# show image
sudo docker images

# run image
#docker run -it ubuntu:18.04
#docker run -it -d --name ubuntu ubuntu:18.04


