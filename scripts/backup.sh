#!/bin/bash

tar czvf /tmp/$(date -Idate)_home.tar.gz \
  --exclude=$HOME/downloads \
  --exclude=**/node_modules/* \
  --exclude=**/.git/* \
  --exclude=**/.local/* \
  --exclude=**/.cache/* \
  --exclude=**/.npm/* \
  --exclude=**/.gradle/* \
  $HOME
