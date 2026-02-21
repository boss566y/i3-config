#!/bin/bash

# requirements "scrot" and "imagemagick"

ICON=$HOME/.config/lockscreen/icon.png
TMPBG=/tmp/screen.png

scrot $TMPBG

scale_down=1%
scale_up=10000%
# scale_up must be 100% * (100% /scale_down)

convert $TMPBG -scale $scale_down -scale $scale_up $TMPBG

if [[ -f $ICON ]] 
then
    # placement x/y
    PX=0
    PY=0
    # lockscreen image info
    R=$(file $ICON | grep -o '[0-9]* x [0-9]*')
    RX=$(echo $R | cut -d' ' -f 1)
    RY=$(echo $R | cut -d' ' -f 3)

    SR=$(xrandr --query | grep ' connected' | grep -o '[0-9]*x[0-9]*+[0-9]*+[0-9]*')
    for RES in $SR
    do
        # monitor position/offset
        SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
        SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
        SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
        SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
        PX=$(($SROX + $SRX/2 - $RX/2))
        PY=$(($SROY + $SRY/2 - $RY/2))

        convert $TMPBG $ICON -geometry +$PX+$PY -composite -matte $TMPBG
#        echo "done"
    done
fi 

i3lock -e -u -i $TMPBG
rm $TMPBG
