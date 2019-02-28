#!/usr/bin/env bash

docker build --build-arg PWD=secret -t localhost:5000/server .
#docker build -t localhost:5000/server .
docker push localhost:5000/server