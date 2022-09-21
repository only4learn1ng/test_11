#!/usr/bin/env bash

sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo bash get-docker.sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker run -d \
    --name $4 \
    -e TZ=Asia/Shanghai \
    --restart=always \
    --net=host \
    ginuerzh/gost:2.11.2 -L=$1:$2@:$3
