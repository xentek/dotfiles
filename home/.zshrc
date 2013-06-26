# The Basics
: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}
: ${HOSTFILE=$HOME/.ssh/known_hosts}

# LANG
: ${LANG:="en_US.UTF-8"}
: ${LANGUAGE:="en"}
: ${LC_CTYPE:="en_US.UTF-8"}
: ${LC_ALL:="en_US.UTF-8"}
export LANG LANGUAGE LC_CTYPE LC_ALL

export SHELL=/usr/local/bin/zsh

# Editor
export EDITOR=/usr/bin/vim
export SVN_EDITOR=/usr/bin/vim

# OH MY ZSH
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="shellstorm"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="false"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler vi-mode ssh-agent)

source $ZSH/oh-my-zsh.sh

# Terminal Options
set -o notify # notify of bg job completion immediately
umask 0022 # dirs will be 775, files 664

# PAGER
if test -n "$(command -v less)" ; then
  PAGER="less -FirSwX"
  MANPAGER="less -FiRswX"
  ACK_PAGER="less -FiRswX"
else
  PAGER=more
  MANPAGER="$PAGER"
  ACK_PAGER="$PAGER"
fi
export PAGER MANPAGER ACK_PAGER

# Ack
export ACK_OPTIONS="--type-add js=.jst --type-add js=.coffee --type-add js=.ejs --type-add ruby=.haml --type-add css=.scss --type-add css=.sass"

# Python
export PYTHONSTARTUP="$HOME/.pystartup"

# Functions
if [[ -s $HOME/.zsh/functions ]] ; then source $HOME/.zsh/functions ; fi

# Aliases
if [[ -s $HOME/.zsh/aliases ]] ; then source $HOME/.zsh/aliases ; fi

# Machine Specific Mods
if [[ -s $HOME/.localrc ]] ; then source $HOME/.localrc ; fi

# rbenv
eval "$(rbenv init -)"

# ssh agent forwarding with oh-my-zsh
zstyle :omz:plugins:ssh-agent agent-forwarding on
