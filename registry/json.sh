#!/usr/bin/env bash

check1=$(which jq)
if [ -z $check1 ]; then
    echo "jq is not installed but needed..."
    echo "On mac please run: brew install jq"
    exit 1
fi

curl -s http://localhost:5000/v2/_catalog | jq