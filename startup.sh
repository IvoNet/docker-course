#!/usr/bin/env bash

echo "Starting docker registry..."
docker-compose -f ./registry/docker-compose.yml up -d

echo "Starting scooch ..."
cd presentation
./scooch.sh

# I created a scooch entry in the /etc/hosts file but if you don't have it use the one below
#open http://localhost

