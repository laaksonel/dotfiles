#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
#while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar -c ~/.config/polybar/config.ini main &
#polybar -r main

echo "---" | tee -a /tmp/polybar1.log
polybar main >>/tmp/polybar1.log 2>&1 &

echo "Bars launched..."
