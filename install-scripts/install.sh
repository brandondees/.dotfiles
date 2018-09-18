#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
set -e

$HOME/.dotfiles/install-scripts/link-dotfiles.rb

sudo apt update
# get all the basic dependencies and utilities
sudo -E apt install -y \
  i3 \
  wget \
  curl \
  git \
  tmux \
  shutter \
  rxvt-unicode \
  feh \
  silversearcher-ag \
  build-essential \
  tcl \
  libqt4-dev \
  libqtwebkit-dev \
  scrot \
  redshift \
  xautolock \
  xclip \
  libssl-dev \
  zlib1g-dev \
  xclip \
  acpi \
  scrot \
  nmap \
  libreadline-dev \
  tzdata

if [ ! -d ~/.dotfiles ]; then
  git clone git@github.com:brandondees/.dotfiles.git ~/.dotfiles || git clone https://github.com/brandondees/.dotfiles ~/.dotfiles
fi

$HOME/.dotfiles/install-scripts/asdf/install.sh
$HOME/.dotfiles/install-scripts/autojump/install.sh
$HOME/.dotfiles/install-scripts/google-chrome/install.sh
$HOME/.dotfiles/install-scripts/maria-db/install.sh
$HOME/.dotfiles/install-scripts/postgresql/install.sh
$HOME/.dotfiles/install-scripts/redis/install.sh
$HOME/.dotfiles/install-scripts/thefuck/install.sh
$HOME/.dotfiles/install-scripts/tig/install.sh
$HOME/.dotfiles/install-scripts/tldr/install.sh
$HOME/.dotfiles/install-scripts/tmuxinator/install.sh
$HOME/.dotfiles/install-scripts/vim/install.sh
$HOME/.dotfiles/install-scripts/zsh/install.sh

# load in asdf for Ruby that was only JUST installed above
. $HOME/.asdf/asdf.sh
