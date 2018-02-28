#!/usr/bin/env bash
docker build -t localhost:5000/server .
docker push localhost:5000/server
docker_dangling