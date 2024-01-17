#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
bars=(
  mybar
)
for x in "${bars[@]}"
do
  polybar ${x} 2>&1 | tee -a /tmp/polybar.log & disown
done

echo "Polybar launched..."
