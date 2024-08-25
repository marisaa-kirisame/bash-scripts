#!/bin/bash

dunstctl set-paused toggle

paused=$(dunstctl is-paused)

if [ "$paused" = "true" ]; then
	echo "Do not disturb mode: ENABLED"
else
	echo "Do not disturb mode: DISABLED"
fi
