
git clone --bare https://github.com/brandondees/.dotfiles $HOME/.dotfiles.git
cd $HOME
/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME checkout

echo 'dotfile repo installed, you may need to start a new session and/or reboot'
