#!/usr/bin/env bash


VOLUME=dockercourse_mysql-data
BACKUP="mysql-18-03-01.tar.bz2"

docker run -it --rm -v ${VOLUME}:/volume -v $(pwd)/backup:/backup localhost:5000/busybox \
       sh -c "rm -rf /volume/* /volume/..?* /volume/.[!.]* ; tar -C /volume/ -xjf /backup/${BACKUP}"