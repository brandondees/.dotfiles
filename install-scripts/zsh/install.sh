#! /usr/bin/env bash

install-package zsh

if [ ! -d ~/.oh-my-zsh ]; then
  git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sudo chsh -s /bin/zsh
chsh -s /bin/zsh
