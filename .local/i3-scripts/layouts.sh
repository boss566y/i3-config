#!/bin/bash

#Script is Activated from .Desktop File
#Desktop file sets the working directory

#Variables
option1="Tabbed"
option2="Tabbed in Split"
option3="Split"
option4="Stacked"
option5="Toggle Split"
option6="Toggle Fullscreen"
option7="Toggle Floating"
option8="Toggle Sticky"

displays="$option1\n$option2\n$option3\n$option4\n$option5\n$option6\n$option7\n$option8"
prompt="Select Command"

#Dmenu Script to Execute Command
selection=$(echo -e "$displays" | dmenu -i -p "$prompt")

case "$selection" in
    "$option1") i3-msg layout tabbed;;
    "$option2") i3-msg split toggle && i3-msg layout tabbed;;
    "$option3") i3-msg layout toggle split;;
    "$option4") i3-msg layout stacking;;
    "$option5") i3-msg split toggle;;
    "$option6") i3-msg fullscreen toggle;;
    "$option7") i3-msg floating toggle;;
    "$option8") i3-msg sticky toggle;;
esac
