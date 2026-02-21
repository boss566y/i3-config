#!/bin/bash

choices=$(cat ./ws_special_list)
prompt="Select Workspace"
#st = start character. ";" added into list and used as separator since it is not found in the list of special workspaces
usr_choice=$(echo -e "$choices" |dmenu -i -p "$prompt" | awk -F: '{ st = index($0,";");print substr($0,st+1)}')
i3-msg move container to workspace $usr_choice



