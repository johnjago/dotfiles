# Adjust the sound from the command line with a 55, etc.
a() {
  amixer set Master "$1"%
}

# Similar for the screen brightness
b() {
  xbacklight -set "$1"%
}
