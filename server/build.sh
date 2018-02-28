#!/usr/bin/env bash
docker build --force-rm -t localhost:5000/server .
docker push localhost:5000/server