# Simple server

## Exercise 1

Search and find a Python 2 or 3 image on docker hub and pull it

## Exercise 2

- Create a work directory
- Create a Dockerfile that will a simple server run a simple server in working directory `/www`

**_Server commands_**
Python 2: `python -m SimpleHTTPServer`
Python 3: `python -m http.server 80`
 

## Exercise 3

Build the created Dockerfile with the name `ordina/server`

## Exercise 4

run the just created image as a container that will:
- run in deamon (detached) mode
- be accessible from the _outside_ on a port 8080
- will service content from the current folder 
- have a process name `server`

## Exercise 5

stop the server and start it again

