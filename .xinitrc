while true
do
  TIME=$(date +"%A %b %d %R")
  BAT="$(acpi -b | awk '{ print $4 }' | tr -d ',')"
  xsetroot -name "$BAT | $TIME"
  sleep 60s
done &

redshift -O 3400 -m randr &
exec dwm
