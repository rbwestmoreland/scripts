#!/bin/sh

# Installs Docker on a Raspbian distribution.

echo ----------------------------------------
echo Updating...
echo ----------------------------------------
sudo apt-get -y update 
sudo apt-get -y upgrade
sudo apt-get autoremove
sudo apt-get autoclean

echo ----------------------------------------
echo Installing Shared Components...
echo ----------------------------------------
sudo apt-get -y install samba

echo ----------------------------------------
echo Installing Docker...
echo ----------------------------------------
sudo docker --version || curl -sSL https://get.docker.com | sh
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker pi

echo ----------------------------------------
echo Complete!
echo ----------------------------------------