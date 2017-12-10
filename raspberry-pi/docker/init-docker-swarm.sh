#!/bin/sh

# Initializes a Docker Swarm on a Raspbian distribution.
# https://howchoo.com/g/njy4zdm3mwy/how-to-run-a-raspberry-pi-cluster-with-docker-swarm

command_exists() {
	command -v "$@" > /dev/null 2>&1
}

echo ----------------------------------------
echo Verifying Docker Installation...
echo ----------------------------------------
if ! command_exists docker; then
    echo "Docker install not found!"
    echo "Please install Docker before running this script."
else
    echo "Docker install found."
fi

echo ----------------------------------------
echo Initializing Docker Swarm...
echo ----------------------------------------
docker swarm init
docker swarm join-token manager
docker service create \
        --name visualizer \
        --publish 8080:8080/tcp \
        --constraint node.role==manager \
        --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
        alexellis2/visualizer-arm:latest

echo ----------------------------------------
echo Docker Swarm Initialized
echo ----------------------------------------
echo "Run the `docker swarm join` commands above on the other swarm nodes."
echo "Once swarm nodes have joined. Run `docker node ls` to confirm nodes."

echo ----------------------------------------
echo Complete!
echo ----------------------------------------