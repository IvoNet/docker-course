#!/usr/bin/env bash

echo "Starting docker registry..."
docker-compose -f ./registry/docker-compose.yml up -d

echo "Starting scooch ..."
docker-compose -f ./presentation/docker-compose.yml up -d
sleep 2
open http://scooch

# I created a scooch entry in the /etc/hosts file but if you don't have it use the one below
#open http://localhost

