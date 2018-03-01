#!/usr/bin/env bash

VOLUME=dockercourse_mysql-data
BACKUP="mysql"

docker run -it --rm -v ${VOLUME}:/volume -v $(pwd)/backup:/backup localhost:5000/busybox \
       tar -cjf /backup/${BACKUP}-$(date +"%y-%m-%d").tar.bz2 -C /volume ./

