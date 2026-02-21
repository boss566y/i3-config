#!/bin/bash

#Choices of to Give Dmenu
#Separate Choices with \n instead of space
#add command to create choices if need be but remember to enclose the choice creation command with "" to preserve new lines

prompt="Select Output"
choices=$(i3-msg -t get_outputs | tr , '\n' | grep "name" | cut -d : -f 2)
usr_choice=$(echo -e "$choices" |dmenu -i -p "$prompt")

i3-msg move workspace to output $usr_choice

#Remember to chmod +x when I finish so that script is executable
#use "ln -s /path/to/script /path/I/want/script" when finished with script
#ie symbolic link so that I can shorten paths in config files
