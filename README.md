Pulsar docker image
===================
Pulsar, Distributed job execution application built for Galaxy.
The Pulsar [Docker](http://www.docker.io) Image is an easy distributable full-fledged Pulsar installation.

Pulsar is a distributed job execution application built for Galaxy.

# Build the image <a name="install" />
The docker image for Pulsar can be found in the [docker hub](https://hub.docker.com/r/fikipollo/pulsar/). However, you can rebuild is manually by running **docker build**.

```sh
sudo docker build -t pulsar .
```
Note that the current working directory must contain the Dockerfile file.

# Running Pulsar <a name="run" />
The recommended way for running your Pulsar docker is using the provided **docker-compose** script that resolves the dependencies and make easier to customize your instance. Alternatively you can run the docker manually.

## Using the docker-compose file
Launching your Pulsar docker is really easy using docker-compose. Just download the *docker-compose.yml* file and customize the content according to your needs. There are few settings that should be change in the file, follow the instructions in the file to configure your container.
To launch the container, type:
```sh
sudo docker-compose up
```
Using the *-d* flag you can launch the containers in background.

In case you do not have the Container stored locally, docker will download it for you.

# Install the image <a name="install" />
You can run manually your containers using the following commands:

```sh
sudo docker run --name pulsar -v /your/data/location/pulsar-data:/usr/local/pulsar -e PRIVATE_TOKEN=yoursupersecrettoken -p 8913:8913 -d fikipollo/pulsar
```

In case you do not have the Container stored locally, docker will download it for you.

A short description of the parameters would be:
- `docker run` will run the container for you.

- `-p 8913:8913` will make the port 8913 (inside of the container) available on port 8913 on your host.
    Inside the container a Pulsar Webserver is running on port 8913 and that port can be bound to a local port on your host computer.

- `fikipollo/pulsar` is the Image name, which can be found in the [docker hub](https://hub.docker.com/r/fikipollo/pulsar/).

- `-d` will start the docker container in daemon mode.

- `-e VARIABLE_NAME=VALUE` changes the default value for a system variable.
The Pulsar docker accepts the following variables that modify the behaviour of the system in the docker.

- **PRIVATE_TOKEN**, the expected token that all Galaxy instances should send in every request. Private token that must be sent as part of the request to authorize use.

For an interactive session, you can execute :

```sh
sudo docker exec -it pulsar-pulsar /bin/bash
```
