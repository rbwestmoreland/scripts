#!/bin/sh

echo ----------------------------------------
echo Updating...
echo ----------------------------------------
apt-get -y update
apt-get -y upgrade
apt-get autoremove
apt-get autoclean

echo ----------------------------------------
echo Installing git...
echo ----------------------------------------
apt-get -y install git

echo ----------------------------------------
echo Installing samba...
echo ----------------------------------------
apt-get -y install samba

echo ----------------------------------------
echo Configuring Raspberry Pi...
echo ----------------------------------------
/usr/bin/rbwestmoreland/scripts/raspberry-pi/raspbian/configure.sh
/usr/bin/rbwestmoreland/scripts/raspberry-pi/raspbian/reboot.sh

echo ----------------------------------------
echo Complete!
echo ----------------------------------------
