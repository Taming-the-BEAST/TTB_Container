TTB_Container
=============

This repository hosts a set of scripts that can be used to build a [Docker](http://docker.com)
container that builds and serves the Taming the BEAST website.

Building
========

1. Install Docker as per the instructions at http://docker.com.

2. From this directory, execute `docker build -t ttb_server .`

Running
=======

Once the image is built, run it using

    docker run -p 80:80 ttb_server

This will build the website and host it locally.  It will then automatically
rebuild itself once per day.
