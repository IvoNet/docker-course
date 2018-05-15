# Docker commit

You can create an image by building it from an image

* `docker run -it --name trial localhost:5000/alpine /bin/sh`
* `apk update`
* `apk add node`
* `npm i -g @angular/cli`
* `ng new quotes --skip-git --verbose` (see README.md)
* `docker commit trial localhost:5000/avans`
* `--rm` can still be committed from other terminal session

# Why

* easy playground
* trial

# Why Not

* You can’t reproduce the image
* You can’t change the base image (upgrading)
* Dockerfile = documentation