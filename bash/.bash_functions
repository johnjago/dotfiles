# Set audio volume
# For example, `a 50` sets volume to 50%
function a()
{
  amixer set Master "$1"%
}

# Set brightness
# For example, `b 50` sets brightness to 50%
function b()
{
  xbacklight -set "$1"%
}

# Countdown timer that shows the time remaining and plays a sound when the
# time is up. For example, `tm 30` sets a timer for 30 minutes.
function time_func()
{
  date=$((`date +%s` + $1));
  while [ "$date" -ne `date +%s` ]; do
    echo -ne "  $(date -u --date @$(($date - `date +%s`)) +%H:%M:%S)\r";
    sleep 1
  done
  play_sound ~/downloads/bowl.wav
}

function tm()
{
  echo "Timer set for $1 minutes"
  time_func $1*60
}

function th()
{
  echo "Timer set for $1 hours"
  time_func $1*60*60
}

function play_sound()
{
  cat $1 | aplay
}
