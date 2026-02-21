#!/bin/bash

#Choices of to Give Dmenu
#Separate Choices with \n instead of space
#add command to create choices if need be but remember to enclose the choice creation command with "" to preserve new lines

default=/home/patrick/.local/i3-scripts/variables/keyboards/i3keys_default
typing=/home/patrick/.local/i3-scripts/variables/keyboards/i3keys_typing
keys_moved=/home/patrick/.local/i3-scripts/variables/keyboards/i3keys_keys_moved


choices="Default\nTyping\nKeysMoved"
#Add Applicable User Prompt
prompt="Change Keyboard Mapping?"
#Change () to "" if the final
usr_choice=$(echo -e "$choices" | dmenu -i -p "$prompt")


case "$usr_choice" in
    "Default") xmodmap $default ;;
    "Typing") xmodmap $typing ;;
    "KeysMoved") xmodmap $keys_moved ;;
 
esac

#Remember to chmod +x when I finish so that script is executable
#use "ln -s /path/to/script /path/I/want/script" when finished with script
