# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="" # using pure power prompt https://github.com/sindresorhus/pure#install

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  autojump
  branch
  bundler
  docker
  docker-compose
  fzf
  gitfast
  rake
  ruby
  rails
  thefuck
  tig
  tmux
  tmuxinator
  zsh_reload # run 'src' to refresh .zshrc
)

# autostart tmux
export ZSH_TMUX_FIXTERM=true
export ZSH_TMUX_AUTOSTART=true
# but don't auto connect to an existing session, make a new one
export ZSH_TMUX_AUTOCONNECT=false
# export ZSH_TMUX_ITERM2=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# If nvim is installed, we'll use that as vim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
eval "$(ssh-agent)"
# export SSH_KEY_PATH="~/.ssh/rsa_id"
export SSH_KEY_PATH="~/.ssh/id_ed25519"

# added by travis gem
# [ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# TheFuck
# https://github.com/nvbn/thefuck
eval $(thefuck --alias qwer)

# for vim control+s
stty -ixon

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Environment Variables
if [ -f "$HOME/.env" ]; then
    . "$HOME/.env"
fi


# Load Postgres.app location into path if present
if [ -d "/Applications/Postgres.app/Contents/Versions/latest/bin" ] ; then
    PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi
# Same for redis.app http://jpadilla.github.io/redisapp/
if [ -d "/Applications/Redis.app/Contents/Resources/Vendor/redis/bin" ] ; then
  PATH="/Applications/Redis.app/Contents/Resources/Vendor/redis/bin:$PATH"
fi

# # Load iterm2's shell integration features if present
# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# asdf version management
# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash
export PATH=$PATH:$HOME/.asdf/installs/rust/stable/bin

# FZF
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
FZF_CTRL_T_COMMAND="ag -g ''"
FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -g ''"

# Tmuxinator autocompletion
# and mux alias
source $HOME/install-scripts/tmuxinator/tmuxinator.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=$HOME/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Run `mkdir .git/safe` on trusted projects to get local bins in path -- H/T Chris Thorn (thorncp)
export PATH=".git/safe/../../bin:$PATH"

# https://sw.kovidgoyal.net/kitty/#configuring-kitty
# kitty completion
# autoload -Uz compinit
# compinit
# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin

# Pure power prompt https://github.com/sindresorhus/pure#install
fpath+=('/home/dees/.asdf/installs/nodejs/11.12.0/.npm/lib/node_modules/pure-prompt/functions')
autoload -U promptinit; promptinit
prompt pure

# Use my own aliases and functions
source ~/.bash_aliases
source ~/.functions/*
