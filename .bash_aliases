# Aliases

# Git Aliases
alias gfc='git fetch upstream && git checkout upstream/master'
alias gfr='git fetch upstream && git rebase -i upstream/master'
alias status='git status'
alias add='git add'
alias commit='git commit'
alias commitm='git commit -m'
alias checkout='git checkout'
alias gco='git checkout'
alias push='git push'
alias pull='git pull'
alias branch='git branch -v'
alias branches='git branches'
alias fetch='git fetch --all --prune'
alias remotes='git remote -v'
alias pullup='git checkout master && git fetch --all && git pull upstream master'

# Personal Shortcuts
alias home='cd ~ && ls -ABCF --color=auto'
alias vi='vim'
alias thunderbolt_darken='sudo ~/.dotfiles/acdcontrol/acdcontrol --silent /dev/usb/hiddev4 -- 10000'
alias thunderbolt_brighten='sudo ~/.dotfiles/acdcontrol/acdcontrol --silent /dev/usb/hiddev4 -- 45000'
alias ding="echo $'\a' && paplay --volume 60000 /usr/share/sounds/freedesktop/stereo/complete.oga"

