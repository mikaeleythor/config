#!/bin/bash
printf 'script started' | systemd-cat -t check-battery #write to log when script is called

POWERINFO=``
STATE=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/state/ {print $2}'`

if [[ "$STATE" = "discharging" ]]; then
	PERCENTAGE=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/ {print $2}' | sed 's/%//'`

	if [[ "$PERCENTAGE" -le 10 ]]; then
        	/usr/bin/notify-send -u normal "battery" "$PERCENTAGE%"
	elif [[ "$PERCENTAGE" -le 5 ]]; then
        	/usr/bin/notify-send -u critical "battery" "$PERCENTAGE%"
	fi
fi
