#!/bin/sh

# Boot script for a Raspbian distribution.
# Install this using init.sh

echo ----------------------------------------
echo Updating scripts...
echo ----------------------------------------
git -C /usr/bin/rbwestmoreland/scripts pull

echo ----------------------------------------
echo Complete!
echo ----------------------------------------