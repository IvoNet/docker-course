# REST Service

The REST back-end service.

Standard Java EE application with a JPA connection to a MySQL database.

The database is connection is configured in the Payara admin console as a jdbc resource
This is packaged into a custom payara image called `server`

## Build

```bash
mvn clean package docker:build
```

## Docker

The docker image of this project can be build with maven.
The Dockerfile can be found in the src/main/docker folder.

This docker image is again a specialization of the payara image in this project

### Usage docker

example usage of this image with the needed database with it

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
    image: localhost:5000/back-end
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
  mysql-data:
    driver: local
```

## Development

If you want to be able to redeploy your war often and easy without heaving to rebuild the docker image constantly but only the jar
you can use the setup described here:

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
      - ./back-end/artifact:/opt/payara5/glassfish/domains/domain1/autodeploy

volumes:
  mysql-data:
    driver: local
```

if run with this config the war file will be redeployed every time you do a `mvn clean package` as
the war file will be put in the `back-end/artifact` folder and this folder is mounted as a volume
to the autodeploy folder of payara. Handy :-)

# Links

* [wadl](http://localhost:8080/back-end/rest/application.wadl)
* [Quote 1](http://localhost:8080/back-end/rest/quote/1)
