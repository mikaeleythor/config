#!/bin/bash

sensors | awk '/Core .:/ {print $3}' | tr "\n" " "
