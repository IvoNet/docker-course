#!/usr/bin/env bash
#########################################################################
# scooch
# Copyright (c) Ivo Woltring
#
# - put this script in your bin folder and chmod +x it
# - Adjust the needed line(s) below according to the instructions
# - make sure the docker-compose.yml file is configured correctly
#   (see example in same folder)
#
# DISCLAIMER
# This script has only been tested on my machine (Macbook Pro) and
# No guarantees of any kind are implied or given. Use at your own risk!
#########################################################################
# Edit the line below to point to the folder where you have your slides #
# and your docker-compose.yml file                                      #
LOCATION="$(pwd)/slides"
#########################################################################


#########################################################################
## Do not edit below this line
#########################################################################
cd "$LOCATION"

# do not edit below
RUNNING=$(docker inspect --format="{{ .State.Running }}" scooch 2> /dev/null)

if [ $? -eq 1 ] || [ "$RUNNING" == "false" ]; then
  docker-compose up -d
  /usr/bin/osascript -e 'display notification "Please refresh the page in a few seconds..." with title "Scooch" subtitle "Starting..."'
  # add scooch to /etc/hosts
  sleep 2
  open http://scooch
else
  /usr/bin/osascript -e 'display notification "Stopping..." with title "Scooch"'
  docker-compose down
  /usr/bin/osascript -e 'display notification "Stopped successfully." with title "Scooch"'
fi
