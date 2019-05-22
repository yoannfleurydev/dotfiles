#!/usr/bin/env bash

# This script is useful to run polybar on i3wm startup

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launche the top bar on every monitors
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload top &
done

echo "Bars launched..."

