#!/bin/bash

#Choices of to Give Dmenu
#Separate Choices with \n instead of space
#add command to create choices if need be but remember to enclose the choice creation command with "" to preserve new lines

#Clearing Variables
mode=""
choice=""
confirm=""

#Variables
prompt1="Choose Mode"

#Select Mode from Mode Variables in i3-config file
i3-msg mode $(i3-msg -t get_binding_modes | tr , '\n' | tr -d [] | dmenu -i -p "$prompt1")

#Command Steps
# Use i3-msg to get modes
# use tr (translate) to switch out commas with new lines
# use tr -d to remove brackets in command output
# dmenu to select option
# use i3 tro change the mode

#Application Folder uses this file to switch modes
