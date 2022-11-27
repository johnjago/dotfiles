#!/bin/bash

# code/ is excluded because it is big and will be compressed separately
# downloads/ is excluded because it has lots of junk that should be sorted to other places if I want to keep it
# The other exclusions are the next few largest directories that don't really need to be in a backup

tar czvf /tmp/home_$(date -Idate).tar.gz \
  --exclude=$HOME/code \
  --exclude=$HOME/downloads \
  --exclude=**/node_modules/* \
  --exclude=**/.local/* \
  --exclude=**/.cache/* \
  --exclude=**/.npm/* \
  --exclude=**/CacheStorage/* \
  --exclude=**/go/src/* \
  --exclude=**/go/pkg/* \
  --exclude=**/Cache/* \
  --exclude=**/.rustup/* \
  --exclude=**/.mozilla/* \
  $HOME

tar czvf /tmp/home_code_$(date -Idate).tar.gz \
  --exclude=**/node_modules/* \
  $HOME/code
