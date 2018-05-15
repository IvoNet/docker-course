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

> It works on my machine!

Note:
- Consistency of env during lifecycle app

---
# Flow

Note:
Dockerfile > image > registry > container(s)

or

Dockerfile > Git repo > CI / CD > building > testing > staging > production

---

<img src="commands.png" style="width:50%;height:50%;display: block;margin: 0 auto;"/>

---

<img src="dockerfile.png" style="width:50%;height:50%;display: block;margin: 0 auto;"/>

Note:
- ENTRYPOINT default `/bin/sh -c`
- CMD No default
- ADD also urls
- COPY basic copy (prefered)
- MAINTAINER (deprecated use label)

---

<img src="docker-compose.png" style="width:100%;height:100%;display: block;margin: 0 auto;"/>

---

<img src="versus.png" style="width:100%;height:100%;display: block;margin: 0 auto;"/>

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
# GitHub

https://github.com/IvoNet/docker-course

or

http://ivo2u.nl/YX
