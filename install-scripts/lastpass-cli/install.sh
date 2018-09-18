#! /usr/bin/env bash

# install build dependencies 
# https://github.com/lastpass/lastpass-cli#debianubuntu
sudo apt --no-install-recommends -yqq install \
  bash-completion \
  build-essential \
  cmake \
  libcurl4  \
  libcurl4-openssl-dev  \
  libssl-dev  \
  libxml2 \
  libxml2-dev  \
  libssl1.1 \
  pkg-config \
  ca-certificates \
  xclip

# install the tool itself
# https://github.com/lastpass/lastpass-cli#building
mkdir tmp
git clone git@github.com:lastpass/lastpass-cli.git
PREVIOUS_DIR=$(pwd)
cd tmp/lastpass-cli
make
sudo make install

# install documentation 
# https://github.com/lastpass/lastpass-cli#documentation
sudo apt-get install -yy asciidoc xsltproc
sudo make install-doc

. ~/.zshrc

cd $PREVIOUS_DIR
rm -rf tmp/lastpass-cli
