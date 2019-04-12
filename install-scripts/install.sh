#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
set -e

sudo apt update
# get all the basic dependencies and utilities
sudo -E apt install -y \
  i3 \
  apt-utils \
  snapd \
  wget \
  curl \
  git \
  editorconfig \
  tmux \
  tldr \
  autojump \
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
  tzdata \
  sqlite3 \
  libsqlite3-dev \
  libmagickwand-dev

if [ ! -d ~/.dotfiles ]; then
  git clone --bare git@github.com:brandondees/.dotfiles.git $HOME/.dotfiles \
    || git clone --bare https://github.com/brandondees/.dotfiles $HOME/.dotfiles
fi

alias dotfile='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfile checkout

export INSTALL_SCRIPTS=$HOME/.config/install-scripts/
# Install tool version manager and ruby
# $HOME/.dotfiles/install-scripts/asdf/install.sh && source $HOME/.asdf/asdf.sh
$INSTALL_SCRIPTS/asdf/install.sh && source $HOME/.asdf/asdf.sh

# Using ruby, hook up the dotfiles
# $HOME/.dotfiles/install-scripts/link-dotfiles.rb

# Install other essential tools with custom scripts
$INSTALL_SCRIPTS/google-chrome/install.sh
$INSTALL_SCRIPTS/maria-db/install.sh
$INSTALL_SCRIPTS/postgresql/install.sh
$INSTALL_SCRIPTS/redis/install.sh
$INSTALL_SCRIPTS/thefuck/install.sh
$INSTALL_SCRIPTS/tig/install.sh
$INSTALL_SCRIPTS/tmuxinator/install.sh
$INSTALL_SCRIPTS/vim/install.sh
$INSTALL_SCRIPTS/zsh/install.sh

# Additional install scripts are available but not deemed essential to a minimal
# dev environment, so go look and see.
