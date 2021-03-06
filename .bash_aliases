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
alias home='cd ~ && ls -ABCF'
alias vi='vim'
alias la='ls -AF'
alias ls='ls -F'
alias ding="echo $'\a'; paplay --volume 50000 /usr/share/sounds/freedesktop/stereo/complete.oga &"
alias servefiles="python3 -m http.server"

# Generate an SSH key easily using best practices (update periodically)
alias ssh-keyme="ssh-keygen -t ed25519 -o -a 100 -C 'dees@pm.me'"

## Personal Writing Habit Shortcuts
alias writemode-enter-workdir="cd ~/Documents/Writing"
alias writemode-create-file="date +'%Y-%m-%d-tbd.md' | xargs -o touch"
alias writemode-begin-file="date +'%Y-%m-%d-tbd.md' | xargs -o vim"
alias writemode-setup="writemode-enter-workdir && writemode-create-file"
alias writemode-edit-latest-file="ls -Art -1 | tail -n 1 | xargs -o vim"
alias writemode="writemode-enter-workdir && writemode-begin-file"
alias writemode-resume="writemode-enter-workdir && writemode-edit-latest-file"

# Dotfile management per https://www.atlassian.com/git/tutorials/dotfiles
alias dotfile='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
