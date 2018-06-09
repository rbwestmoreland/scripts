#!/bin/sh

# Boot script for a Raspbian distribution.
# Install this using init.sh

echo ----------------------------------------
echo Updating scripts...
echo ----------------------------------------
git -C /usr/bin/rbwestmoreland/scripts pull
find /usr/bin/rbwestmoreland/scripts/ -type f -iname "*.sh" -exec chmod +x {} \;

echo ----------------------------------------
echo Complete!
echo ----------------------------------------
