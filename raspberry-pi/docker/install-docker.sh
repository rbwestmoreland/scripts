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
if ! command_exists docker; then
    curl -sSL https://get.docker.com | sh
    systemctl enable docker
    systemctl start docker
    usermod -aG docker pi
fi
docker --version

echo ----------------------------------------
echo Complete!
echo ----------------------------------------