#!/usr/bin/env bash

sudo apt -y install font-manager
# now you can just use that to userspace install individual font files

echo "Next step is installing nerd fonts, which is big and can take a while..."
mkdir ~/nerd-fonts
git clone git@github.com:ryanoasis/nerd-fonts.git ~/nerd-fonts
~/nerd-fonts/install
