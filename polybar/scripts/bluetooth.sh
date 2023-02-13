#!/bin/bash

bluetooth_print() {
		if [ "$(systemctl is-active bluetooth.service)" = "active" ]; then
				printf "%%{T1}  "
				printf "$(bluetoothctl info | awk -F ': ' '/^.Alias/ {print $2}')"
				printf "%%{T-}"
		else
		    printf "%%{T0}  "
		fi
}

bluetooth_print


