#!/bin/bash

##Initialization
default_ws=-1
default_offset=0
move_ws=1

offset=${2:-$default_offset}
dest_ws=${1:-$default_ws}

dest_ws=$(($dest_ws + $offset))

prompt="Select WorkSpace"

##Selections
if [ $(($dest_ws + 0)) -eq $(($default_ws + $offset)) ]; then
    move_ws=0
    choices=$(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 )
    if dest_ws=$(echo -e "$choices" | dmenu -i -p "$prompt"); then
	    move_ws=1
    fi
fi 

##Execution
if [[ $move_ws == 1 ]]; then
    #i3-msg move container to workspace number $dest_ws
    i3-msg workspace number $dest_ws
fi
