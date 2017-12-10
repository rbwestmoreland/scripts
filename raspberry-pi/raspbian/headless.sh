#!/bin/sh

# Configure Raspbain for headless operation.

read -p "Headless? [Y|n]" HEADLESS
HEADLESS=${HEADLESS:-y}
if [[ "$HEADLESS" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
    echo "Headless"
else
    echo "Not headless"
fi