# kwetter

Your description here

# Project information

The project starts out with a fully configured minimal JavaEE 8 setup and HelloWorld endpoint

# Project Commands 

| Command     | Description                                                                                                                                                                                                    |
|:----------- |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|run          | Start docker locally and expose docker volume `/autodeploy` to directory `./artifact` so that every time `mvn package` is run locally it will automatically redeploy the application in the docker environment |
|build        | will build the application and the docker image                                                                                                                                                                |
|build-run    | will build the application and the docker image and run locally                                                                                                                                                |
|build-deploy | will build the application and the docker image and deploy that image to the docker registry                                                                                                                   |
|logs         | will show the logs if run with `build-run`                                                                                                                                                                     |

# Docker

* The docker image is hosted as [ivonet/payara](http://ivo2u.nl/tM)
* The docker image is maintained [here](http://ivo2u.nl/tX) 

# Example endpoint

[http://localhost:8080/kwetter/rest/example](http://localhost:8080/kwetter/rest/example)