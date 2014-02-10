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

#if [ -f "${HOME}/.gpg-agent-info" ]; then
  #. "${HOME}/.gpg-agent-info"
  #export GPG_AGENT_INFO
  #export SSH_AUTH_SOCK
#fi

# bump up ulimit
ulimit -n 1024

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# bundler
alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
