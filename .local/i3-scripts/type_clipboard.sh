#!/bin/bash

# Original with sh and delay
# sh -c 'sleep 5.0; xdotool type --clearmodifiers "$(xclip -o -selection clipboard)"'

sleep 1.0; xdotool type --clearmodifiers "$(xclip -o -selection clipboard)"
