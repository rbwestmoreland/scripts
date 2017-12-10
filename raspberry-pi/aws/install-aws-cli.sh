#!/bin/sh

# Installs AWS CLI on a Raspbian distribution.

echo ----------------------------------------
echo Updating...
echo ----------------------------------------
sudo apt-get -y update 
sudo apt-get -y upgrade
sudo apt-get autoremove
sudo apt-get autoclean

echo ----------------------------------------
echo Installing Python pip...
echo ----------------------------------------
sudo apt-get -y install python-pip

echo ----------------------------------------
echo Installing AWS CLI...
echo ----------------------------------------
pip install awscli --upgrade --user
aws --version || export PATH=$PATH:~/.local/bin
aws configure

echo ----------------------------------------
echo Complete!
echo ----------------------------------------