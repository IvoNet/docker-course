#!/usr/bin/env bash

docker-compose -f ../registry/docker-compose.yml up -d

registerDockerImageLocalRegistry() {
    echo "Pulling: $1"
    docker pull $1
    docker rmi localhost:5000/$2 2> /dev/null
    docker tag $1 localhost:5000/$2
    docker push localhost:5000/$2
    docker rmi localhost:5000/$2 2> /dev/null
}

cd ../mysql
./build.sh

#registerDockerImageLocalRegistry mysql:5.7.25 mysql
registerDockerImageLocalRegistry ivonet/payara:5.184 payara
registerDockerImageLocalRegistry alpine:3.9 alpine
registerDockerImageLocalRegistry ivonet/openjdk:8 jdk8
registerDockerImageLocalRegistry node:11.10-alpine node
registerDockerImageLocalRegistry phpmyadmin/phpmyadmin:4.7 phpmyadmin
registerDockerImageLocalRegistry gogs/gogs:latest gogs
registerDockerImageLocalRegistry ivonet/py3 python
