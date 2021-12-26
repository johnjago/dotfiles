VOLUME=$(
	amixer sget Master | \
	grep -e 'Mono:' | \
	sed 's/[^\[]*\[\([0-9]\{1,3\}\).*\(on\|off\).*/\2 \1/' | \
	sed 's/off/M/' | \
	sed 's/on //'
)
BATTERY=$(acpi -b | awk '{ print $4 }' | tr -d ',%')
STATUS=$(acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi')
TIME=$(date +"%a %-d %b %R")

if [ $BATTERY -lt 10 ] && [ $STATUS = 'Discharging' ]; then
	BATTERY='Low battery'
	# timeout is there so that notify-send doesn't hang if there's no daemon
	timeout 2s notify-send 'Low battery'
fi

xsetroot -name " $VOLUME ❬ $BATTERY ❬ $TIME "
