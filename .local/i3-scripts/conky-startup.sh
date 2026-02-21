#!/bin/bash

#Kill Previous Processes
killall conky


#Set Concky Variables
# placement x/y
PX=0
PY=0
# lockscreen image info

#Primary monitor
SR=$(xrandr --query | grep 'connected' | grep 'primary' | grep -o '[0-9]*x[0-9]*+[0-9]*+[0-9]*')

# monitor position/offset
SRX=$(echo $SR | cut -d'x' -f 1)                   # x pos
SRY=$(echo $SR | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
SROX=$(echo $SR | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
SROY=$(echo $SR | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset

#Conky Size Info
CX=300
#CY=600

#Desired Right Offset
CSX=100
#CSY=0

PX=$(($SRX - $CX - $CSX))
PY=100

sleep 5s && conky -c "/home/patrick/.config/i3-conky/active.conkyrc" -a "top_left" -x $PX -y $PY &
