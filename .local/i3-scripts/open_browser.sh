#!/bin/bash

#Choices of to Give Dmenu
#Separate Choices with \n instead of space
#add command to create choices if need be but remember to enclose the choice creation command with "" to preserve new lines

browser1="Firefox"
browser2="Chrome"
browser3="Firefox (Private)"
browser4="Chrome (Private)"
browser5="Firefox (Choose Profile)"


choices="$browser1\n$browser2\n$browser3\n$browser4\n$browser5"
#Add Applicable User Prompt
prompt="Open Web Browser"
#Change () to "" if the final
usr_choice=$(echo -e "$choices" |dmenu -i -p "$prompt")


case "$usr_choice" in
    "$browser1") firefox;;
    "$browser2") google-chrome-stable;;
    "$browser3") firefox -private-window;;
    "$browser4") google-chrome-stable -incognito;;
    "$browser5") firefox -no-remote -P;;
esac


#Remember to chmod +x when I finish so that script is executable
#use "ln -s /path/to/script /path/I/want/script" when finished with script
#ie symbolic link so that I can shorten paths in config files
