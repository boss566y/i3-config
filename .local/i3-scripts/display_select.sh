#!/bin/bash

#Variables
display1="Left"
display2="Center"
display3="Bottom Right"
display4="Top Right"
multimonitor1="All"
multimonitor2="Both Right"
multimonitor3="Bottom Only"
manual="Manual Configuration"
wallpapers="Adjust Wallpapers"
conky="Restart Conky"
bool_refresh=0

displays="$multimonitor1\n$display1\n$display2\n$display3\n$display4\n$multimonitor3\n$multimonitor2\n$manual\n$wallpapers\n$conky"
text="Select Display"

#Dmenu Script to Execute Command
if selection=$(echo -e "$displays" | dmenu -i -p "$text"); then
	bool_refresh=1
fi

case "$selection" in
    "$display1") xrandr \
--output eDP --off \
--output DisplayPort-2 --off \
--output DisplayPort-3 --off \
--output DisplayPort-4 --off \
--output DisplayPort-5 --off \
--output DisplayPort-6 --off \
--output DisplayPort-7 --off \
--output DisplayPort-8 --off \
--output DisplayPort-9 --off \
--output DisplayPort-10 --off \
--output DisplayPort-11 --off \
--output DisplayPort-1-0 --off \
--output DisplayPort-1-1 --off \
--output HDMI-A-1-0 --off \
--output HDMI-A-1-1 --primary --mode 1920x1080 --pos 0x960 --rotate left;;
    "$display2")  xrandr \
--output eDP --off \
--output DisplayPort-2 --off \
--output DisplayPort-3 --off \
--output DisplayPort-4 --off \
--output DisplayPort-5 --off \
--output DisplayPort-6 --off \
--output DisplayPort-7 --off \
--output DisplayPort-8 --off \
--output DisplayPort-9 --primary --mode 1920x1080 --pos 1080x1800 --rotate normal \
--output DisplayPort-10 --off \
--output DisplayPort-11 --off \
--output DisplayPort-1-0 --off \
--output DisplayPort-1-1 --off \
--output HDMI-A-1-0 --off \
--output HDMI-A-1-1 --off;;
    "$display3")  xrandr \
--output eDP --off \
--output DisplayPort-2 --off \
--output DisplayPort-3 --primary --mode 2560x1440 --pos 3000x1440 --rotate normal \
--output DisplayPort-4 --off \
--output DisplayPort-5 --off \
--output DisplayPort-6 --off \
--output DisplayPort-7 --off \
--output DisplayPort-8 --off \
--output DisplayPort-9 --off \
--output DisplayPort-10 --off \
--output DisplayPort-11 --off \
--output DisplayPort-1-0 --off \
--output DisplayPort-1-1 --off \
--output HDMI-A-1-0 --off \
--output HDMI-A-1-1 --off;;
    "$display4")  xrandr \
--output eDP --off \
--output DisplayPort-2 --off \
--output DisplayPort-3 --off \
--output DisplayPort-4 --off \
--output DisplayPort-5 --off \
--output DisplayPort-6 --off \
--output DisplayPort-7 --off \
--output DisplayPort-8 --off \
--output DisplayPort-9 --off \
--output DisplayPort-10 --off \
--output DisplayPort-11 --off \
--output DisplayPort-1-0 --off \
--output DisplayPort-1-1 --off \
--output HDMI-A-1-0 --primary --mode 2560x1440 --pos 3000x0 --rotate normal \
--output HDMI-A-1-1 --off;;
    "$multimonitor1")  xrandr \
--output eDP --off \
--output DisplayPort-2 --off \
--output DisplayPort-3 --mode 2560x1440 --pos 3000x1440 --rotate normal \
--output DisplayPort-4 --off \
--output DisplayPort-5 --off \
--output DisplayPort-6 --off \
--output DisplayPort-7 --off \
--output DisplayPort-8 --off \
--output DisplayPort-9 --primary --mode 1920x1080 --pos 1080x1800 --rotate normal \
--output DisplayPort-10 --off \
--output DisplayPort-11 --off \
--output DisplayPort-1-0 --off \
--output DisplayPort-1-1 --off \
--output HDMI-A-1-0 --mode 2560x1440 --pos 3000x0 --rotate normal \
--output HDMI-A-1-1 --mode 1920x1080 --pos 0x960 --rotate left;;
    "$multimonitor2")  xrandr \
--output eDP --off \
--output DisplayPort-2 --off \
--output DisplayPort-3 --primary --mode 2560x1440 --pos 3000x1440 --rotate normal \
--output DisplayPort-4 --off \
--output DisplayPort-5 --off \
--output DisplayPort-6 --off \
--output DisplayPort-7 --off \
--output DisplayPort-8 --off \
--output DisplayPort-9 --off \
--output DisplayPort-10 --off \
--output DisplayPort-11 --off \
--output DisplayPort-1-0 --off \
--output DisplayPort-1-1 --off \
--output HDMI-A-1-0 --mode 2560x1440 --pos 3000x0 --rotate normal \
--output HDMI-A-1-1 --off;;
    "$multimonitor3")  xrandr \
--output eDP --off \
--output DisplayPort-2 --off \
--output DisplayPort-3 --mode 2560x1440 --pos 3000x1440 --rotate normal \
--output DisplayPort-4 --off \
--output DisplayPort-5 --off \
--output DisplayPort-6 --off \
--output DisplayPort-7 --off \
--output DisplayPort-8 --off \
--output DisplayPort-9 --primary --mode 1920x1080 --pos 1080x1800 --rotate normal \
--output DisplayPort-10 --off \
--output DisplayPort-11 --off \
--output DisplayPort-1-0 --off \
--output DisplayPort-1-1 --off \
--output HDMI-A-1-0 --off \
--output HDMI-A-1-1 --mode 1920x1080 --pos 0x960 --rotate left;;
    "$manual") arandr
					bool_refresh=0 ;;
    "$wallpapers") feh --randomize --bg-scale ~/.local/i3-wallpapers/* 
					bool_refresh=0;;
    "$conky") conky-startup.sh
					bool_refresh=0;;
esac

if [[ $bool_refresh == 1 ]]
then
	feh --randomize --bg-scale ~/.local/i3-wallpapers/*
	conky-startup.sh
fi
