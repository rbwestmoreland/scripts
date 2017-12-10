#!/bin/sh

# Installs AWS CLI on a Raspbian distribution.

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
pip install awscli --upgrade --user
aws configure

echo ----------------------------------------
echo Complete!
echo ----------------------------------------