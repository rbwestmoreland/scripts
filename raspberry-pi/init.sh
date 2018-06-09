#!/bin/sh
set -x

# git clone this repo and install boot.sh on a Raspbian distribution.

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
echo Installing rbwestmoreland/scripts...
echo ----------------------------------------
rm -rf /usr/bin/rbwestmoreland/scripts
git clone https://github.com/rbwestmoreland/scripts.git /usr/bin/rbwestmoreland/scripts
grep -q "/usr/bin/rbwestmoreland/scripts/boot.sh" /etc/rc.local || sed -i -e '$i sh /usr/bin/rbwestmoreland/scripts/boot.sh\n' /etc/rc.local
find /usr/bin/rbwestmoreland/scripts/ -type f -iname "*.sh" -exec chmod +x {} \;

echo ----------------------------------------
echo Configuring Raspberry Pi...
echo ----------------------------------------
bash "/usr/bin/rbwestmoreland/scripts/raspberry-pi/raspbian/configure.sh"
bash "/usr/bin/rbwestmoreland/scripts/raspberry-pi/raspbian/reboot.sh"

echo ----------------------------------------
echo Complete!
echo ----------------------------------------
