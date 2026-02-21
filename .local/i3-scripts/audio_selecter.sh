#!/bin/bash

# What Command Are Doing
# Pactl lists the audio outputs
# grep gets the line with sink number and sink name
# tr removes the #'s and newlines(\n)
# first sed adds back newlines (\n) for each sink so that sink numbers and names are on the same line and changes sink to output
# second sed removes the blank line at the top of the data stream casue by first sed
# third sed removes the word description
# fourth sed removes the tab (\t) in the output
#pipe into dmenu

#set $audio_script ~/scripts/audio_script.sh

selection=$(pactl list sinks | grep -E 'Sink|Description'| tr -d  "#\n" | sed 's/Sink/\nOutput/g' |sed '/^$/d'| sed 's/Description: / /g' |sed 's/\t//g' | dmenu -i -l 5 -p "Change Audio Output?" | awk '{print $2}')

audio_script.sh $selection
