#! /usr/bin/env bash

sudo apt-get install -y \
  openvpn \
  dialog \
  wget \
  python

sudo wget -O protonvpn-cli.sh https://raw.githubusercontent.com/ProtonVPN/protonvpn-cli/master/protonvpn-cli.sh

sudo chmod +x ./protonvpn-cli.sh
sudo ./protonvpn-cli.sh --install
rm -f ./protonvpn-cli.sh

sudo protonvpn-cli --update

echo "The Protonvpn cli tool should be ready to configure and use now."
echo "you can run the following to configure and activate the vpn:"
echo "sudo protonvpn-cli -init"
echo "sudo protonvpn-cli -connect"

