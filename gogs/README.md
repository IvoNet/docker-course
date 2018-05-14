# Your own GITHUB

## How To

* `docker run --name=gogs --rm -p 10022:22 -p 10000:3000 -v $(pwd)/data:/data gogs/gogs`
* Docker compose
* goto [localhost:10000](http://localhost:10000)
* Database:
    * sqlite3
* url:
    * http://localhost:10000
* admin user:
    * create one


# Volumes

example on how to look into a volume:
* `docker run -it --rm -v gogs_gogs-data:/data localhost:5000/alpine find /data`
