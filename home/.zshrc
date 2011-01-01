# The Basics
: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}
: ${HOSTFILE=~/.ssh/known_hosts}

# LANG
: ${LANG:="en_US.UTF-8"}
: ${LANGUAGE:="en"}
: ${LC_CTYPE:="en_US.UTF-8"}
: ${LC_ALL:="en_US.UTF-8"}
export LANG LANGUAGE LC_CTYPE LC_ALL

# Terminal Options
set -o notify # notify of bg job completion immediately
umask 0022 # dirs will be 775, files 664

# ENVIRONMENT STUFF
BLACK="%{"$'\033[01;30m'"%}"
BROWN="%{"$'\033[0;33m'"%}"
GREEN="%{"$'\033[01;32m'"%}"
RED="%{"$'\033[01;31m'"%}"
YELLOW="%{"$'\033[01;33m'"%}"
BLUE="%{"$'\033[01;34m'"%}"
BOLD="%{"$'\033[01;39m'"%}"
NORM="%{"$'\033[00m'"%}"

export PS1="${GREEN}%m${NORM}:${BLUE}%~${NORM}$ "
export XDEBUG_CONFIG="idekey=xentek"

# PATH
export PATH=$PATH
# put ~/bin on PATH if you have it
test -d "$HOME/bin" &&
PATH="$HOME/bin:$PATH"

export MANPATH="/usr/local/share/man:$MANPATH"
export INFOPATH="/usr/local/share/info:$INFOPATH"

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

# Shortcuts
alias wpfetch='wget http://wordpress.org/latest.tar.gz && tar xzvf ./latest.tar.gz && rm -f ./latest.tar.gz'
alias wptrunk='svn export http://svn.automattic.com/wordpress-mu/trunk/ && mv trunk/* . && rm -rf trunk'

# LS
alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'

# GREP
alias grep='grep --color=auto -i'

# SVN
alias svnadd='svn st | grep \? | awk '\''{print "svn add "$2 }'\'' | zsh'
alias svnst='svn st --ignore-externals'
alias svnext='svn pe svn:externals .'
alias svnign='svn pe svn:ignore .'
alias delsvn='find . -name .svn | xargs rm -rf'
export LC_CTYPE=en_US.UTF-8
export SVN_EDITOR=/usr/bin/vi

# GIT
alias gst='git status'
alias gb='git branch'
alias gitp='git pull && git push'
alias gitundo='git commit --amend'
alias fixgit='git config branch.master.remote origin && git config branch.master.merge refs/heads/master'
alias gitit='git pull && git ci -a && git push'
alias gitdbg='git ci -am "dbg" && git push'

# Python
export PYTHONSTARTUP="$HOME/.pystartup"

#TOOLS
alias yuicompress="java -jar $HOME/bin/yuicompressor-2.4.2.jar"
alias closurecompiler="java -jar $HOME/bin/compiler.jar"

# OSX Only
if [ "$UNAME" = Darwin ]; then
    # put ports on the paths if /opt/local exists
    test -x /opt/local -a ! -L /opt/local && {
        PORTS=/opt/local

        # setup the PATH and MANPATH
        export PATH="$PORTS/bin:$PORTS/sbin:$PORTS/apache2/bin:$PATH"
        export MANPATH="$PORTS/share/man:$MANPATH"

        # nice little port alias
        alias port="sudo nice -n +18 $PORTS/bin/port"
    }

    test -x /usr/pkg -a ! -L /usr/pkg && {
        export PATH="/usr/pkg/sbin:/usr/pkg/bin:$PATH"
        export MANPATH="/usr/pkg/share/man:$MANPATH"
    }
	
	# Other OSX only aliases
	alias dbg='open /Applications/MacGDBp.app'
	alias imsize='sips -g pixelWidth -g pixelHeight'

	# DNS
	alias syncdns="cd /Users/xentek/Sites/dns-new/dns && rm -rf /Users/xentek/Sites/dns-new/dns/env.xentek /Users/xentek/Sites/dns-new/dns/env.slave && /Users/xentek/Sites/dns-new/dns/compile-dns.pl xentek && /Users/xentek/Sites/dns-new/dns/compile-dns.pl slave && rsync -avHS env.xentek 67.23.32.231:~ && rsync -avHS env.slave 174.143.252.196:~"
	alias flushdns='dscacheutil -flushcache'
		
	# DEV STUFF
	alias mysql='/opt/local/bin/mysql5'
	alias mysqladmin='/opt/local/bin/mysqladmin5'
	alias mysqlctl='sudo /opt/local/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper'
	alias vhosts='mate -w /opt/local/apache2/conf/vhosts'
	alias phpini='mate -w /opt/local/etc/php5/php.ini && sudo /opt/local/apache2/bin/apachectl restart'

	# Stuff That's Available on Mac and Linux, but with different commands
	alias sshkey='cat ~/.ssh/id_rsa.pub | pbcopy'
	alias hosts='mate /etc/hosts'
	alias zshrc='mate -w ~/.zshrc && source ~/.zshrc'
	alias updatedb='sudo /usr/libexec/locate.updatedb'
	alias mysqlrestart='sudo /opt/local/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper restart'
	alias apacherestart='sudo /opt/local/apache2/bin/apachectl restart'

fi

if [ "$UNAME" = Linux ]; then
	alias ack="ack-grep"
	alias free="free -m"
	alias update="sudo aptitude update"
	alias install="sudo aptitude install"
	alias upgrade="sudo aptitude safe-upgrade"
	alias fullupgrade="sudo aptitude full-upgrade"
	alias remove="sudo aptitude remove"
	alias search="aptitude search"
	alias show="aptitude show"
	alias apache2ctl="sudo /etc/init.d/apache2"
	alias a2enmod="sudo a2enmod"
	alias a2dismod="sudo a2dismod"
	alias a2ensite="sudo a2ensite"
	alias a2dissite="sudo a2dissite"
	alias nginxrestart='sudo /etc/init.d/nginx restart'

	# Stuff That's Available on Mac and Linux, but with different commands
	alias sshkey='cat ~/.ssh/id_rsa.pub'
	alias hosts='vi /etc/hosts'
	alias zshrc='vi ~/.zshrc && source ~/.zshrc'
	alias updatedb='sudo updatedb'
	alias mysqlrestart='sudo /etc/init.d/mysql restart'
	alias apacherestart='sudo /etc/init.d/apache2 restart'
fi

# Machine Specific Mods
if [[ -s $HOME/.localrc ]] ; then source $HOME/.localrc ; fi

# RVM
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi