#!/bin/bash

#maybe add hibernate command if I add an external swap partition to my Linux. Possible when I switch to my nuc
settings="Lock\nExit\nShutdown\nRestart"

# single quotes needed as it fails to run otherwise
#l1='/home/common/pics/lockpaper.png'
#w1='/home/patrick/Pictures/wallpaper.jpg'


prompt="Choose An Action"

selection=$(echo -e "$settings" | dmenu -i -p "$prompt")

case "$selection" in
    "Lock") lock.sh ;;
#    "Suspend") betterlockscreen -s dimblur ;;
    "Exit") i3-msg exit ;;
#    "Wallpapers") betterlockscreen -u $l1;;
    "Shutdown") shutdown -h now ;;
    "Restart") shutdown -hr now ;;
esac
