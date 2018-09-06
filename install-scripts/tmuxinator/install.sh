#! /usr/bin/env bash

if [ $(which tmuxinator) ]; then
  # copy down the current tmuxinator autocomplete script
  curl -s -o $HOME/.dotfiles/install-scripts/tmuxinator/tmuxinator.zsh https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh

  # source the script
  . $HOME/.dotfiles/install-scripts/tmuxinator/tmuxinator.zsh

  # provide some output indicating whether this succeeded
  tmuxinator doctor
fi

