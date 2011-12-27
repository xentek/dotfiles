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
export EDITOR=vi
export SVN_EDITOR=vi

# Terminal Options
set -o notify # notify of bg job completion immediately
umask 0022 # dirs will be 775, files 664

# Colors
BLACK="%{"$'\033[01;30m'"%}"
BROWN="%{"$'\033[0;33m'"%}"
GREEN="%{"$'\033[01;32m'"%}"
RED="%{"$'\033[01;31m'"%}"
YELLOW="%{"$'\033[01;33m'"%}"
BLUE="%{"$'\033[01;34m'"%}"
BOLD="%{"$'\033[01;39m'"%}"
NORM="%{"$'\033[00m'"%}"

# (Left) Prompt
export PS1="${GREEN}%m${NORM}:${BLUE}%~${NORM}$ "

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
