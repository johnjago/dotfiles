# Set audio volume
function a()
{
  amixer set Master "$1"%
}

# Set brightness
function b()
{
  xbacklight -set "$1"%
}

# Countdown timer
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
