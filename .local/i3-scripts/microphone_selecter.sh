#!/bin/bash

# What Command Are Doing
# Pactl lists the audio outputs
# grep gets the line with source number and source name
# tr removes the #'s and newlines(\n)
# first sed adds back newlines {\n) for each source so that source numbers and names are on the same line and changes source to microphone
# second sed removes the blank line at the top of the data stream casue by first sed
# third sed removes the word description
# fourth sed removes the tab (\t) in the output
#pipe into dmenu

#set $audio_script ~/scripts/audio_script.sh

selection=$(pactl list sources | grep -E 'Source|Description'| tr -d  "#\n" | sed 's/Source/\nMicrophone/g' |sed '/^$/d'| sed 's/Description: / /g' |sed 's/\t//g' | dmenu -i -l 5 -p "Change Microphone?" | awk '{print $2}')

pactl set-default-source $selection