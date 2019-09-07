#! /usr/bin/env bash
if [ ! -d ~/.asdf ]; then
  git clone git@github.com:asdf-vm/asdf.git ~/.asdf --branch v0.7.1 \
    || git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.1
fi

. $HOME/.asdf/asdf.sh

asdf update
asdf plugin-add adr-tools
asdf plugin-add ruby
asdf plugin-add nodejs
asdf plugin-add
asdf plugin-update --all

asdf install ruby 2.5.1
asdf global ruby 2.5.1

asdf install adr-tools 3.0.0
asdf global adr-tools 3.0.0

cat $HOME/.default-gems | xargs gem install
