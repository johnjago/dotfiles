#!/bin/bash

tar czvf /tmp/home_$(date -Idate).tar.gz \
  --exclude=$HOME/downloads \
  --exclude=**/node_modules/* \
  --exclude=**/.git/* \
  --exclude=**/.local/* \
  --exclude=**/.cache/* \
  --exclude=**/.npm/* \
  --exclude=**/.gradle/* \
  --exclude=**/cartinsight/* \
  --exclude=**/CacheStorage/* \
  --exclude=**/go/src/* \
  --exclude=**/Cache/* \
  --exclude=**/.rustup/* \
  $HOME
