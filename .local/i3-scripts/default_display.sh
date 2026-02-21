#!/bin/sh

xrandr \
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
--output HDMI-A-1-1 --mode 1920x1080 --pos 0x960 --rotate left

feh --randomize --bg-scale /home/patrick/.local/i3-wallpapers/*
