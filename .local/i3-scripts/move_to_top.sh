#!/bin/bash

default_ws=-1
dest_ws=${1:-$default_ws}
prompt="Select WorkSpace"

# Current Workspace Name and Display
tree=$(i3-msg -t get_tree)
focused=$(i3-msg -t get_workspaces | sed 's/,{/\n/g' | grep '"focused":true')
monitor_output=$(echo -e $focused | tr , '\n' | grep '"output":' | cut -d : -f 2  | cut -d \" -f 2)
workspace=$(echo -e $focused | tr , '\n' | grep '"name":' | cut -d : -f 2 | cut -d \" -f 2)


move_up=$(python3 ./top.py "$tree" "$monitor_output" "$workspace")

for x in $(seq 1 $move_up)
do
	i3-msg focus parent
done

if [ $(($dest_ws + 0)) -eq $(($default_ws + 0)) ]; then

	choices=$(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 )
	dest_ws=$(echo -e "$choices" |dmenu -i -p "$prompt")
	
fi 

i3-msg move container to workspace number $dest_ws
