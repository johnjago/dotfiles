while true
do
  TIME=$(date +"%a %-d %b %R")
  BATTERY=$(acpi -b | awk '{ print $4 }' | tr -d ',')
  if [ $(echo $BATTERY | tr -d '%') -lt 15 ]; then
    xsetroot -name " LOW BATTERY "
  else
    xsetroot -name " 🗲 $BATTERY · $TIME "
  fi
  sleep 60s
done &

feh --bg-scale ~/images/wallpaper.*
redshift -O 3700 -m randr
exec dwm
