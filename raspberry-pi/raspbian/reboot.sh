#!/bin/sh

read -p "Reboot? [Y|n] " PI_REBOOT
PI_REBOOT=${PI_REBOOT:-y}
if [[ "$PI_REBOOT" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
    reboot -h now
fi