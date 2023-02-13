#!/bin/bash

volume_print() {
		pactl list sinks | grep '^[[:space:]]Volume:' | \
		head -n $(( $(pa-active-sink) + 1)) | tail -n 1 | \
		sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'
}

ramp_map() {
		if [[ "$1" -lt 10 ]]; then
				printf " $1"
		elif [[ $1 -lt 20 ]]; then
				printf " $1"
		elif [[ $1 -lt 30 ]]; then
				printf " $1"
		elif [[ $1 -lt 40 ]]; then
				printf " $1"
		elif [[ $1 -lt 50 ]]; then
				printf " $1"
		elif [[ $1 -lt 60 ]]; then
				printf " $1"
		elif [[ $1 -lt 70 ]]; then
				printf " $1"
		elif [[ $1 -lt 80 ]]; then
				printf " $1"
		elif [[ $1 -lt 90 ]]; then
				printf " $1"
		else
				printf " $1"
		fi
}

ramp_map "$(volume_print)"
