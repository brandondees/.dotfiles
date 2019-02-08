#! /usr/bin/env bash

# grab the tool, note the distro package isn't latest version
sudo apt install -y restic

# enable the autocompletions
restic generate --zsh-completion ~/.oh-my-zsh/custom/plugins/restic/restic-completion.zsh

# load the AWS S3 access creds
. ./restic_creds.env

# Initialize a backup repo such as:
# restic -r s3:s3.amazonaws.com/backup-restic-macbuntu init

# Perform backup:
# restic -r 

echo "restic installed, backup configuration and execution requires manual action still..."

