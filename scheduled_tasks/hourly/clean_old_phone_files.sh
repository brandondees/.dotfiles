#!/usr/bin/bash

# SRC="/home/dees/Pictures/Phone Pictures"
SRC="/home/dees/Pictures/Phone Photos"
DEST="/home/dees/Pictures/Phone Picture Archive"
OLDER_THAN_DAYS=1

echo "Moving files from $SRC to $DEST ..."
cd "$SRC"
pwd
time find . \
  -type f \
  -mtime +$OLDER_THAN_DAYS \
  -print \
  -name './**.jpg' -or \
  -name './**/**.jpg' -or \
  -name './**.gif' -or \
  -name './**/**.gif' -or \
  -name './**.mp4' \
  -name './**/**.mp4' \
  -not -path '*/\.*' \
  | xargs -I _ rsync --itemize-changes --remove-source-files -aR _ "$DEST"

exit 1
