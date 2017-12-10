#!/bin/sh

# Installs Docker on a Raspbian distribution.

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
docker --version || curl -sSL https://get.docker.com | sh
systemctl enable docker
systemctl start docker
usermod -aG docker pi

echo ----------------------------------------
echo Complete!
echo ----------------------------------------