#!/bin/bash

ws_group="/home/patrick/.local/i3-scripts/variables/ws_group"
ws=$(( $(cat $ws_group) + 1))
echo -e $ws > $ws_group
