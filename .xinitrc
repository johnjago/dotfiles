while true
do
  sh .xsetroot.sh

  BATTERY=$(acpi -b | awk '{ print $4 }' | tr -d ',')
  if [ $(echo $BATTERY | tr -d '%') -lt 15 ]; then
    notify-send 'Low battery'
  fi
  sleep 60s
done &

feh --bg-fill ~/images/wallpaper/002.*
redshift -O 3700 -m randr
exec dwm
