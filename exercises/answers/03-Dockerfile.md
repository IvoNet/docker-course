```dockerfile
FROM ivonet/py2
WORKDIR /www
VOLUME ["/www"]
EXPOSE 8000
ENTRYPOINT ["/usr/local/bin/python", "-m", "SimpleHTTPServer"]
```
or

```dockerfile
FROM python:2.7.16-alpine3.8
WORKDIR /www
VOLUME ["/www"]
EXPOSE 8000
ENTRYPOINT ["/usr/local/bin/python", "-m", "SimpleHTTPServer"]
```