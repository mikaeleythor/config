#!/bin/bash

killall -q polybar

polybar -c $HOME/.config/polybar/config main 2>&1 | tee -a /tmp/polybar.log & disown
if [[ "$( connected-DVI-monitors )" = DVI* ]]; then
    polybar -c $HOME/.config/polybar/config secondary 2>&1 | 
        tee -a /tmp/polybar.log & disown;
fi

echo "Polybar launched.."
