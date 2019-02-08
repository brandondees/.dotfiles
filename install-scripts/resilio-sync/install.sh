#! /usr/bin/env bash

# https://help.resilio.com/hc/en-us/articles/206178924
echo "deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" | sudo tee /etc/apt/sources.list.d/resilio-sync.list
wget -qO - https://linux-packages.resilio.com/resilio-sync/key.asc | sudo apt-key add -

sudo apt-get update && \
  sudo apt-get install resilio-sync

sudo systemctl enable resilio-sync
sudo systemctl start resilio-sync

echo "Access the Resilio Sync Web GUI at http://localhost:8888/gui/"
