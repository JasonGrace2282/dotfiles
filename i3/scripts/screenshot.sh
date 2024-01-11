#!/bin/bash
maim -s --format png | xclip -selection clipboard -t image/png -i
dunstify -u low "Screenshot" "Screenshot copied to clipboard!"
