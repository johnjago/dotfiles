while true
do
  TIME=$(date +"%A %b %d %R")
  BAT=$(acpi -b | awk '{ print $4 }' | tr -d ',')
  if [ $(echo $BAT | tr -d '%') -lt 15 ]; then
    xsetroot -name " LOW BATTERY "
  else
    xsetroot -name " [ $BAT ] [ $TIME ] "
  fi
  sleep 60s
done &

feh --bg-scale ~/images/wallpaper.*
redshift -O 3700 -m randr
exec dwm
