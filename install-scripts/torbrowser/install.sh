#!/usr/bin/env bash

# TODO: test for lynx isntalled, install if not
echo "Downloading torbrowser for linux, this can take a while."

DOWNLOAD_PAGE=https://www.torproject.org/download/
lynx -dump -hiddenlinks=listonly $DOWNLOAD_PAGE \
  | grep "https://www.torproject.org/dist/torbrowser/.*/tor-browser-linux64-.*_en-US.tar.xz" \
  | cut -d' ' -f4- \
  | wget -i-

# TODO: use .asc to verify sig

echo 'torbrowser downloaded, extracting to home...'
tar -xf *.tar.xz -C $HOME
