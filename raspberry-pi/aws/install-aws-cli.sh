#!/bin/sh

# Installs AWS CLI on a Raspbian distribution.

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
echo Installing Python pip...
echo ----------------------------------------
apt-get -y install python-pip

echo ----------------------------------------
echo Installing AWS CLI...
echo ----------------------------------------
if ! command_exists aws; then
    pip install awscli --upgrade --user
fi
aws configure

echo ----------------------------------------
echo Complete!
echo ----------------------------------------