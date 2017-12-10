#!/bin/sh

# git clone this repo and install boot.sh on a Raspbian distribution.

echo ----------------------------------------
echo Updating...
echo ----------------------------------------
sudo apt-get -y update 
sudo apt-get -y upgrade
sudo apt-get autoremove
sudo apt-get autoclean

echo ----------------------------------------
echo Installing git...
echo ----------------------------------------
sudo apt-get -y install git

echo ----------------------------------------
echo Installing scripts...
echo ----------------------------------------
sudo rm -rf /usr/bin/rbwestmoreland/scripts
sudo git clone https://github.com/rbwestmoreland/scripts.git /usr/bin/rbwestmoreland/scripts
sudo grep -q "/usr/bin/rbwestmoreland/scripts/boot.sh" /etc/rc.local || sudo sed -i -e '$i sh /usr/bin/rbwestmoreland/scripts/boot.sh\n' /etc/rc.local

echo ----------------------------------------
echo Complete!
echo ----------------------------------------