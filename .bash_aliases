# Aliases

alias home='cd ~ && ls -ABCF --color=auto'
alias vi='vim'

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
