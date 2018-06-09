#!/bin/sh

echo ----------------------------------------
echo Installing rbwestmoreland/scripts...
echo ----------------------------------------
apt-get -qq -y install git
rm -rf /usr/bin/rbwestmoreland/scripts
git clone https://github.com/rbwestmoreland/scripts.git /usr/bin/rbwestmoreland/scripts --quiet
grep -q "/usr/bin/rbwestmoreland/scripts/boot.sh" /etc/rc.local || sed -i -e '$i sh /usr/bin/rbwestmoreland/scripts/boot.sh\n' /etc/rc.local
find /usr/bin/rbwestmoreland/scripts/ -type f -iname "*.sh" -exec chmod +x {} \;

echo ----------------------------------------
echo Complete!
echo ----------------------------------------
