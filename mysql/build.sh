#!/usr/bin/env bash
docker build --force-rm -t localhost:5000/mysql .
docker push localhost:5000/mysql
