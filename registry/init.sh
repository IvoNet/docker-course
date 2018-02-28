#!/usr/bin/env bash

docker-compose -f ../registry/docker-compose.yml up -d

doDocker() {
    echo "Pulling: $1"
    docker pull $1
    docker rmi localhost:5000/$2 2> /dev/null
    docker tag $1 localhost:5000/$2
    docker push localhost:5000/$2
    docker rmi localhost:5000/$2 2> /dev/null
}

doDocker mysql:5.7.21 mysql
doDocker payara/server-full payara
doDocker alpine:3.7 alpine
doDocker openjdk:8 jdk8
doDocker node:9.6.1-alpine node
doDocker phpmyadmin/phpmyadmin:4.6.4-1 phpmyadmin

