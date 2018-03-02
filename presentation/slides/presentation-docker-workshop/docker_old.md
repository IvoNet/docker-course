<!-- .slide: data-background="orange" -->
# Docker

<img src="docker.png" style="width:50%;height:50%;display: block;margin: 0 auto;"/>

---
# Who

Ivo Woltring  
Codesmith   
@  
Ordina JTech    

---

# ?

---
# Whaaat???

---
# Why?

Note:
- Maintenance
- Modular build
- Free technology choice (language / tools / os)
- bugs isolated

---

> It works on my machine!

Note:
- Consistency of env during lifecycle app

---

Virtual Machine

vs

Docker

Note:
- Virtual machines waste resources
- Docker containers are kinda lightweight vm

---
# Image

---
# Container


Note:
- Runtime version of the image (Session)
---

# Registry / hub

Note:
- Show hub.docker.com

---
# Flow

Note:
Dockerfile > image > registry > container(s)

or

Dockerfile > Git repo > CI / CD > building > testing > staging > production

---

<img src="commands.png" style="width:50%;height:50%;display: block;margin: 0 auto;"/>

---

# Dockerfile

```dockerfile
FROM alpine

LABEL maintainer="@IvoNet"

CMD ["echo", "Hello, Wold."]

```
---

<img src="dockerfile.png" style="width:50%;height:50%;display: block;margin: 0 auto;"/>

Note:
- ENTRYPOINT default `/bin/sh -c`
- CMD No default
- ADD also urls
- COPY basic copy (prefered)
- MAINTAINER (deprecated use label)
---

# docker-compose

---

<img src="compose.png" style="width:100%;height:100%;display: block;margin: 0 auto;"/>

---

# Security

Note:
- base image
- Root
- do you trust the creator?

---
# ?
--- 
<!-- .slide: data-background="orange" -->

https://www.ivonet.nl   
Twitter: @ivonet  

---
# Resource

* [Best Practices](http://ivo2u.nl/Yv)