#! /usr/bin/env bash
if [ ! -d ~/.asdf ]; then
  git clone git@github.com:asdf-vm/asdf.git ~/.asdf --branch v0.7.1 \
    || git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.1
fi

. $HOME/.asdf/asdf.sh

# TODO: split individual tools/groups into their own installers
asdf update
asdf plugin-add adr-tools
asdf plugin-add ruby
asdf plugin-add nodejs
asdf plugin-update --all

# ADR Tools (Architecture Decision Records)
asdf install adr-tools 3.0.0
asdf global adr-tools 3.0.0

# NodeJS
# https://github.com/asdf-vm/asdf-nodejs#using-a-dedicated-openpgp-keyring
export GNUPGHOME="${ASDF_DIR:-$HOME/.asdf}/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"
# Imports Node.js release team's OpenPGP keys to the keyring
bash $HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 12.10.0
asdf global nodejs 12.10.0
cat $HOME/.default-npm-packages | xargs npm install
npm install -g pure-prompt

# Ruby
asdf install ruby 2.5.1
asdf global ruby 2.5.1
cat $HOME/.default-gems | xargs gem install
