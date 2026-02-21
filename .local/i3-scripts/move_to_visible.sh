#!/bin/bash

#Choices of to Give Dmenu
#Separate Choices with \n instead of space
#add command to create choices if need be but remember to enclose the choice creation command with "" to preserve new lines

prompt="Select Display"

choices=$(i3-msg -t get_outputs | tr , '\n' | grep "name" | cut -d : -f 2)
display_choice=$(echo -e "$choices" |dmenu -i -p "$prompt")

workspace=$(i3-msg -t get_outputs | sed 's/,{/\n/g' | grep $display_choice | tr , '\n' | grep '"current_workspace":' | cut -d : -f 2 )
#workspace=$(echo -e "$choices" |dmenu -i -p "$prompt")

#i3-msg move container to workspace number $usr_choice
i3-msg workspace number $workspace

#Remember to chmod +x when I finish so that script is executable
#use "ln -s /path/to/script /path/I/want/script" when finished with script
#ie symbolic link so that I can shorten paths in config files
