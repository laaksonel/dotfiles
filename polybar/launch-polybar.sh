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

#echo "---" | tee -a /tmp/polybar1.log
#polybar main >>/tmp/polybar1.log 2>&1 &

xrandr --output DVI-D-0 --mode 1920x1080 --rate 144.00

BAR_NAME=main
BAR_CONFIG=/home/$USER/.config/polybar/config.ini

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

MONITOR=$PRIMARY polybar --reload -c $BAR_CONFIG $BAR_NAME &
sleep 1

for m in $OTHERS; do
	MONITOR=$m polybar --reload -c $BAR_CONFIG $BAR_NAME &
done

echo "Bars launched..."
