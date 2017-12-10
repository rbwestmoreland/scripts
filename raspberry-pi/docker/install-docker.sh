#!/bin/sh

# Installs Docker on a Raspbian distribution.

command_exists() {
	command -v "$@" > /dev/null 2>&1
}

echo ----------------------------------------
echo Updating...
echo ----------------------------------------
apt-get -y update 
apt-get -y upgrade
apt-get autoremove
apt-get autoclean

echo ----------------------------------------
echo Installing Shared Components...
echo ----------------------------------------
apt-get -y install samba

echo ----------------------------------------
echo Installing Docker...
echo ----------------------------------------
if command_exists docker; then
    echo "Docker is already installed!"
else
    curl -sSL https://get.docker.com | sh
    systemctl enable docker
    systemctl start docker
    usermod -aG docker pi
fi

echo ----------------------------------------
echo Verifying Docker...
echo ----------------------------------------
docker --version
docker run hello-world

echo ----------------------------------------
echo Complete!
echo ----------------------------------------