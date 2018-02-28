#!/usr/bin/env bash
docker build --force-rm -t localhost:5000/web .
docker push localhost:5000/web