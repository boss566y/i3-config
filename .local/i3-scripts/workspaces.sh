#!/bin/bash

#Script is Activated from .Desktop File
#Desktop file sets the working directory
cd /home/patrick/.local/i3-scripts/


#Variables

#Options Sets
optionSet1="New Workspace"
optionSet2="Move (with) Container"
optionSet3="Move to Workspace"
optionSet4="Move (with) Display"
optionSet5="Refactor Workspaces"

usr_options="$optionSet1\n$optionSet5\n$optionSet2\n$optionSet3\n$optionSet4"
prompt="Select Command(s)"

selection=$(echo -e "$usr_options" | dmenu -i -p "$prompt")

# Workspace Scripts
option1="Move Container"
option2="Move with Container"
option3="Move to Workspace"
option4="New WorkSpace"
option5="Move WorkSpace"
option6="Move to Display"
option7="Move with Container to Active Display"
option8="Move Container to Special"

case "$selection" in
    "$optionSet1") ./new_workspace.sh;;
    "$optionSet2") selection=$(echo -e "$option1\n$option2\n$option7\n$option8" | dmenu -i -p "$optionSet2");;
    "$optionSet3") selection=$(echo -e "$option3\n$option2\n$option6\n$option7" | dmenu -i -p "$optionSet3");;
    "$optionSet4") selection=$(echo -e "$option5\n$option6\n$option7" | dmenu -i -p "$optionSet4");;
    "$optionSet5") ./min_ws.sh;;
esac


case "$selection" in
    "$option1") ./move_container.sh;;
    "$option2") ./move_with_container.sh;;
    "$option3") ./move_to_workspace.sh;;
    "$option4") ./new_workspace.sh;;
    "$option5") ./move_workspace.sh;;
    "$option6") ./move_to_visible.sh;;
    "$option7") ./move_container_to_visible.sh;;
    "$option8") ./ws_special.sh;;
esac
