#!/bin/sh

echo ----------------------------------------
echo Installing rbwestmoreland/scripts...
echo ----------------------------------------

# install git
apt-get -qq -y install git

# remove the old installation
rm -rf /usr/bin/rbwestmoreland/scripts

# clone the lastest version
git clone https://github.com/rbwestmoreland/scripts.git /usr/bin/rbwestmoreland/scripts --quiet

# install boot.sh
grep -q "/usr/bin/rbwestmoreland/scripts/boot.sh" /etc/rc.local || sed -i -e '$i sh /usr/bin/rbwestmoreland/scripts/boot.sh\n' /etc/rc.local

# make scripts executable
find /usr/bin/rbwestmoreland/scripts/ -type f -iname "*.sh" -exec chmod +x {} \;

echo ----------------------------------------
echo Complete!
echo ----------------------------------------
