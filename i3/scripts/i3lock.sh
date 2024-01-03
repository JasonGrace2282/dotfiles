#!/bin/sh

img=/tmp/i3lock.png

maim $img
convert -scale 10% -blur 0x2.5 -resize 1000% $img $img

i3lock -i $img

