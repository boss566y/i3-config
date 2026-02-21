#!/bin/bash

cd /home/patrick/.local/i3-scripts/

WS=$(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -n)
ws_max=$(echo $WS | tail -1)
destination_ws=1

for ws in $WS
do
    if [ $(($ws + 0)) -ne 0 ]; then
        i3-msg workspace number $ws
        ./move_to_top.sh $destination_ws
        i3-msg workspace number $destination_ws
        destination_ws=$(($destination_ws+1))
    fi
done

i3-msg restart
#Remember to chmod +x when I finish so that script is executable
#use "ln -s /path/to/script /path/I/want/script" when finished with script
#ie symoblic link so that I can shorten paths in config files
