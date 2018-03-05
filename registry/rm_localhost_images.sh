#!/bin/sh
#docker rmi $(docker images --filter=reference='localhost*/*:*' -q)
docker rmi $(docker images --filter=reference='localhost*/*:*' --format {{.Repository}}:{{.Tag}})
