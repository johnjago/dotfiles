while true
do
  sh .xsetroot.sh
  sleep 60s
done &

# Set the wallpaper
feh --bg-fill ~/photos/wallpaper/002.*

# Use a low color temperature all day
xsct 3700

# Turn on the notification daemon
dunst > /dev/null 2>&1 &

# Move the ctrl key to the caps lock key
setxkbmap -option "ctrl:nocaps"

# Start the window manager
exec dbus-launch dwm
