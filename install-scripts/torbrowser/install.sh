#!/usr/bin/env bash

echo "Downloading torbrowser for linux, this can take a while."

# Fetch the regular browser download page
# find what resembles the latest linux download link
# cut away everything from that line that's not the download url
# follow the download url (including redirects) to fetch the file
# extract the download to a standard location where it's ready for use
curl -s https://www.torproject.org/download/ \
  | grep "https://www.torproject.org/dist/torbrowser/.*/tor-browser-linux64-.*_en-US.tar.xz" \
  | sed 's/.*href="//' \
  | sed 's/">//' \
  | xargs curl -#GL --output downloaded.tar.xz

tar -xf downloaded.tar.xz -C $HOME
