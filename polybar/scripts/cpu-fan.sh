#!/bin/bash

sensors | awk '/cpu_fan/ {print $2,$3}'
