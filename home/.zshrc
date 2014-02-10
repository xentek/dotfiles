# basics
: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}
: ${HOSTFILE=$HOME/.ssh/known_hosts}

# prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# terminal options
set -o notify # notify of bg job completion immediately
umask 0022 # dirs will be 775, files 664
ulimit -n 1024

# functions
if [[ -s $HOME/.zsh/functions ]] ; then source $HOME/.zsh/functions ; fi

# aliases
if [[ -s $HOME/.zsh/aliases ]] ; then source $HOME/.zsh/aliases ; fi

# localrc
if [[ -s $HOME/.localrc ]] ; then source $HOME/.localrc ; fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# python
export PYTHONSTARTUP="$HOME/.pystartup"

#if [ -f "${HOME}/.gpg-agent-info" ]; then
  #. "${HOME}/.gpg-agent-info"
  #export GPG_AGENT_INFO
  #export SSH_AUTH_SOCK
#fi
