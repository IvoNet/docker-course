#!/usr/bin/env bash

mvn clean dependency:copy-dependencies -f ./setup-pom.xml

docker build -t localhost:5000/server .
docker push localhost:5000/server

mvn clean -f ./setup-pom.xml