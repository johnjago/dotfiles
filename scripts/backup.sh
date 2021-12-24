#!/bin/bash

tar czvf /tmp/home_$(date -Idate).tar.gz \
  --exclude=**/node_modules/* \
  --exclude=**/.local/* \
  --exclude=**/.cache/* \
  --exclude=**/.npm/* \
  --exclude=**/.gradle/* \
  --exclude=**/cartinsight/* \
  --exclude=**/CacheStorage/* \
  --exclude=**/go/src/* \
  --exclude=**/go/pkg/* \
  --exclude=**/Cache/* \
  --exclude=**/.rustup/* \
  $HOME
