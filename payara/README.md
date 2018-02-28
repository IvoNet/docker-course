# Payara full-server

This Docker image is based on the `payara/server-full:latest` image from docker hub.

it was pulled and the stored into the local registry with the `localhost:5000/payara` tag.

So the Dockerfile can inherit from that image.

## Build

use the `build.sh`  script as it will provide the needed MySQL jdbc jar to add to the
image as the jdbc config needs it to be able to work as defined.

## Usage

This compose file illustrates the use of this image

```text
version: '3'

services:
  mysql:
    image: localhost:5000/mysql
    volumes:
      - ./mysql/quotes:/docker-entrypoint-initdb.d
      - ./volumes/testdata/mysql:/testdata
      - mysql-data:/var/lib/mysql
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=secret
      
  payara:
    image: localhost:5000/server
    ports:
      - "8080:8080"
      - "4848:4848"
      - "8181:8181"
      - "8009:8009"
    links:
      - mysql:mysql
    depends_on:
      - mysql
    volumes:
      - ./back-end/artifact:/opt/payara41/glassfish/domains/domain1/autodeploy


volumes:
  mysql-data:
    driver: local
```