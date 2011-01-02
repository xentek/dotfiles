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

# SSH - XENTEK
alias hostedbyxentek='ssh 67.23.32.231'
alias xenproxy1='ssh proxy.mey.hostedbyxentek.net'
alias meydb1='ssh db.mey.hostedbyxentek.net'
alias meyweb1='ssh web.mey.hostedbyxentek.net'
alias meyweb2='ssh web2.mey.hostedbyxentek.net'
alias meyweb3='ssh web3.mey.hostedbyxentek.net'
alias xentek='ssh 174.143.27.190'
alias gcaweb='ssh web.gca.hostedbyxentek.net'
alias eaweb='ssh web.ea.hostedbyxentek.net'
alias rpmweb='ssh web.rpm.hostedbyxentek.net'
alias orb='ssh web.orb.hostedbyxentek.net'
alias jj="ssh 67.23.32.248"
alias bpdev="ssh 69.164.205.135"
alias bp="ssh 69.164.202.104"

# SSH - Clients
alias adsblog='ssh 209.20.76.164'
alias asa="ssh -i /Users/xentek/.ssh/asa_slice -p 16885 deploy@173.203.89.165"
alias asaqa="ssh -i /Users/xentek/.ssh/asa_slice -p 16885 deploy@184.106.206.94"

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
# put $HOME/bin on PATH if you have it
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

# SSH-AGENT
SSH_ENV="$HOME/.ssh/environment"
function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

# Aliases
alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -l"
alias la="ls -A"
alias grep="grep --color=auto -i"
alias wpfetch="wget http://wordpress.org/latest.tar.gz && tar xzvf ./latest.tar.gz && rm -f ./latest.tar.gz"

# SVN
alias svnadd='svn st | grep \? | awk '\''{print "svn add "$2 }'\'' | zsh'
alias svnst='svn st --ignore-externals'
alias svnext='svn pe svn:externals .'
alias svnign='svn pe svn:ignore .'
alias delsvn='find . -name .svn | xargs rm -rf'
export SVN_EDITOR="/usr/bin/vi"

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
	alias syncdns="cd $HOME/Sites/dns-new/dns && rm -rf $HOME/Sites/dns-new/dns/env.xentek $HOME/Sites/dns-new/dns/env.slave && $HOME/Sites/dns-new/dns/compile-dns.pl xentek && $HOME/Sites/dns-new/dns/compile-dns.pl slave && rsync -avHS env.xentek 67.23.32.231:~ && rsync -avHS env.slave 174.143.252.196:~"
	alias flushdns='dscacheutil -flushcache'
		
	# DEV STUFF
	alias mysql="$PORTS/bin/mysql5"
	alias mysqladmin="$PORTS/bin/mysqladmin5"
	alias mysqlctl="sudo $PORTS/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper"
	alias vhosts="mate -w $PORTS/apache2/conf/vhosts"
	alias phpini="mate -w $PORTS/etc/php5/php.ini && sudo $PORTS/apache2/bin/apachectl restart"

	# Stuff That's Available on Mac and Linux, but with different commands
	alias sshkey="cat $HOME/.ssh/id_rsa.pub | pbcopy"
	alias hosts="mate /etc/hosts"
	alias zshrc="mate -w $HOME/.zshrc && source $HOME/.zshrc"
	alias updatedb="sudo /usr/libexec/locate.updatedb"
	alias mysqlrestart="sudo $PORTS/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper restart"
	alias apacherestart="sudo $PORTS/apache2/bin/apachectl restart"

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
	alias nginxrestart="sudo /etc/init.d/nginx restart"

	# Stuff That's Available on Mac and Linux, but with different commands
	alias sshkey='cat $HOME/.ssh/id_rsa.pub'
	alias hosts='vi /etc/hosts'
	alias zshrc='vi $HOME/.zshrc && source $HOME/.zshrc'
	alias updatedb='sudo updatedb'
	alias mysqlrestart='sudo /etc/init.d/mysql restart'
	alias apacherestart='sudo /etc/init.d/apache2 restart'
	
	#DNS
	alias syncdns="sudo rsync -avHS $HOME/env.xentek/ /var/cache/bind/ && sudo chown -R root:bind /var/cache/bind/ && sudo chown -R bind:bind /var/cache/bind/slave/ && sudo rndc reload"
	alias syncdns_slave="sudo rsync -avHS $HOME/env.slave/ /var/cache/bind/ && sudo chown -R root:bind /var/cache/bind/ && sudo chown -R bind:bind /var/cache/bind/slave/ && sudo rndc reload"
fi

# Machine Specific Mods
if [[ -s $HOME/.localrc ]] ; then source $HOME/.localrc ; fi

# RVM
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
