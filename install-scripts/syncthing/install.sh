#! /usr/bin/env bash

# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Add the "stable" channel to your APT sources:
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update and install syncthing:
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get install syncthing

mkdir -p ~/.config/systemd/user/
cp syncthing.service ~/.config/systemd/user

systemctl --user enable syncthing.service
systemctl --user start syncthing.service
systemctl --user status syncthing.service
