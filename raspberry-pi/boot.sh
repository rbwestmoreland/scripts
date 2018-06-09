#!/bin/sh

echo ----------------------------------------
echo Updating scripts...
echo ----------------------------------------

# get latest
git -C /usr/bin/rbwestmoreland/scripts pull

# make scripts executable
find /usr/bin/rbwestmoreland/scripts/ -type f -iname "*.sh" -exec chmod +x {} \;

echo ----------------------------------------
echo Complete!
echo ----------------------------------------
