while true
do
  TIME=$(date +"%A %b %d %R")
  BAT="$(acpi -b | awk '{ print $4 }' | tr -d ',')"
  xsetroot -name " [ $BAT ] [ $TIME ] "
  sleep 60s
done &

feh --bg-scale ~/images/wallpaper.*
redshift -O 3700 -m randr
exec dwm
