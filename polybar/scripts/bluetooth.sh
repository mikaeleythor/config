#!/bin/bash

bluetooth_print() {
	if [ "$(bluetoothctl show | awk -F ': ' '/^.Powered/ {print $2}')" = "yes" ]; then
				printf "%%{T3} "
				printf "$(bluetoothctl info | awk -F ': ' '/^.Alias/ {print $2}')"
				printf "%%{T-}"
		else
		    printf "%%{T3} "
		fi
}

bluetooth_toggle() {
	if [ "$(bluetoothctl show | awk -F ': ' '/^.Powered/ {print $2}')" = "yes" ]; then
		bluetoothctl power off
	elif [ "$(bluetoothctl show | awk -F ': ' '/^.Powered/ {print $2}')" = "no" ]; then
		bluetoothctl power on
	fi
}

if [ -z "$1" ]; then
	bluetooth_print
elif [ "$1" = "--toggle" ]; then
	bluetooth_toggle
fi


