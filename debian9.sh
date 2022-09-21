#!/usr/bin/env bash

sed -i 's/stretch/buster/g' /etc/apt/sources.list
apt update
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update
apt install -y docker-ce

curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

docker run -d \
    --name $4 \
    -e TZ=Asia/Shanghai \
    --restart=always \
    --net=host \
    ginuerzh/gost:2.11.2 -L=$1:$2@:$3
