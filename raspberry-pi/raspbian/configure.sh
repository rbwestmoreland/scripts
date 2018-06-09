#!/bin/sh

# Configure Raspbain without entering raspi-config.
# https://raspberrypi.stackexchange.com/questions/28907/how-could-one-automate-the-raspbian-raspi-config-setup

read -p "Hostname: [$HOSTNAME] " PI_HOSTNAME
PI_HOSTNAME=${PI_HOSTNAME:-$HOSTNAME}
raspi-config nonint do_hostname $PI_HOSTNAME

read -p "GPU Memory Split: [16|32|64|128|256] " PI_GPU_SPLIT
PI_GPU_SPLIT=${PI_GPU_SPLIT:-16}
raspi-config nonint do_memory_split $PI_GPU_SPLIT
