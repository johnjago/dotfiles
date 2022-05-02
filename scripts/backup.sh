#!/bin/bash

# code and downloads have big files, so those will be compressed separately
#tar czvf /tmp/home_$(date -Idate).tar.gz \
#  --exclude=$HOME/code \
#  --exclude=$HOME/downloads \
#  --exclude=**/node_modules/* \
#  --exclude=**/.local/* \
#  --exclude=**/.cache/* \
#  --exclude=**/.npm/* \
#  --exclude=**/CacheStorage/* \
#  --exclude=**/go/src/* \
#  --exclude=**/go/pkg/* \
#  --exclude=**/Cache/* \
#  --exclude=**/.rustup/* \
#  --exclude=**/.mozilla/* \
#  $HOME

tar czvf /tmp/home_code_$(date -Idate).tar.gz \
  --exclude=**/node_modules/* \
  $HOME/code

tar czvf /tmp/home_downloads_$(date -Idate).tar.gz \
  $HOME/downloads
