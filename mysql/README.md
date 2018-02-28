# mysql Docker image

A specialized image for MySQL based on the standard mysql image.

This image is tuned to monitor a TEST_DIR folder file up and running.
if you put sql files into this folder they will be executed on the database
and when done removed.

## build

* Run `build.sh` from this folder


## Usage

```text
version: '3'

services:
  mysql:
    image: localhost:5000/mysql
    volumes:
      - ./mysql/setup:/docker-entrypoint-initdb.d
      - ./volumes/testdata/mysql:/testdata
      - mysql-data:/var/lib/mysql
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=secret

```