# Docker course

This project contains the code needed for my docker course.

# Important note

This course was developed on a Mac and therefore it will only have bash scripts.
You might have to do some translations when using Windows as the operating system.
No support will be provided.

# Usage

To get to the starting point of this course is to start with `startup.sh`.
That will start the registry and Scooch the presentation app

## back-end

A simple Java EE application providing quotes through a REST interface.
The application gets its quotes from a database through the Java Persisitence Api (JPA).  

Read more [here](./back-end/README.md)

## mysql

Is a specialized docker image with mysql installed. You can read more about it [here](./mysql/README.md)

## payara

Is a full blown Java EE application server used to serve our back-end.
[here](./payara/README.md) you can get a full description

## presentation

The [Scooch](http://ivo2u.nl/Yi) markdown presentation to this course. Read more [here](./presentation/README.md)

## registry

The local docker registry. Read more [here](./registry/README.md)

## web

The fantastic web interface :-). Read more [here](./web/README.md)


## Resources

* [PhpMyAdmin](http://localhost:8888/)
* [Payara Admin Console](http://localhost:4848)
* [Web page](http://localhost:3000)
* [Rest Service](http://localhost:8080/back-end/rest/quote/1)


## web

Simple nodejs server with simple html page


 
## License
    
    DON'T BE A DICK PUBLIC LICENSE
    
    Version 1, December 2009
    
    Copyright (C) 2018 IvoNet.nl <WebMaster@ivonet.nl>
    
     Everyone is permitted to copy and distribute verbatim or modified
     copies of this license document, and changing it is allowed as long
     as the name is changed.
    
    > DON'T BE A DICK PUBLIC LICENSE
    > TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
    
     1. Do whatever you like with the original work, just don't be a dick.
    
         Being a dick includes - but is not limited to - the following instances:
    
    	 1a. Outright copyright infringement - Don't just copy this and change the name.
    	 1b. Selling the unmodified original with no work done what-so-ever, that's REALLY being a dick.
    	 1c. Modifying the original work to contain hidden harmful content. That would make you a PROPER dick.
    
     2. If you become rich through modifications, related works/services, or supporting the original work,
     share the love. Only a dick would make loads off this work and not buy the original work's
     creator(s) a pint.
    
     3. Code is provided with no warranty. Using somebody else's code and bitching when it goes wrong makes
     you a DONKEY dick. Fix the problem yourself. A non-dick would submit the fix back.
    
