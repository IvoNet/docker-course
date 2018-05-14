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

#registerDockerImageLocalRegistry mysql:5.7.21 mysql
registerDockerImageLocalRegistry payara/server-full:5.181 payara
registerDockerImageLocalRegistry alpine:3.7 alpine
registerDockerImageLocalRegistry openjdk:8 jdk8
registerDockerImageLocalRegistry node:9.6.1-alpine node
registerDockerImageLocalRegistry phpmyadmin/phpmyadmin:4.6.4-1 phpmyadmin
registerDockerImageLocalRegistry gogs/gogs:latest gogs
registerDockerImageLocalRegistry python:2.7-alpine python
