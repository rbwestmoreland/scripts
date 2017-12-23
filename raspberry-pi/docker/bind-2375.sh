#!/bin/sh

# Binds the Docker daemon to tcp port 2375 for remote access.

echo ----------------------------------------
echo Updating /etc/default/docker...
echo ----------------------------------------

if [ -f "/etc/default/docker" ]; then
	grep DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock" /etc/default/docker || echo 'DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"' >> /etc/default/docker
	echo The file /etc/default/docker was successfully updated!
else
	echo The file /etc/default/docker was not found!
fi

echo ----------------------------------------
echo Complete!
echo ----------------------------------------