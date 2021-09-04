VOLUME=$(amixer sget Master | grep -e 'Front Left:' | sed 's/[^\[]*\[\([0-9]\{1,3\}\).*\(on\|off\).*/\2 \1/' | sed 's/off/M/' | sed 's/on //')
BATTERY=$(acpi -b | awk '{ print $4 }' | tr -d ',%')
TIME=$(date +"%a %-d %b %R")

xsetroot -name " $VOLUME ❬ $BATTERY ❬ $TIME "
