# ENVIRONMENT STUFF
BLACK="%{"$'\033[01;30m'"%}"
GREEN="%{"$'\033[01;32m'"%}"
RED="%{"$'\033[01;31m'"%}"
YELLOW="%{"$'\033[01;33m'"%}"
BLUE="%{"$'\033[01;34m'"%}"
BOLD="%{"$'\033[01;39m'"%}"
NORM="%{"$'\033[00m'"%}"

export PS1="${GREEN}%m${NORM}:${BLUE}%~${NORM}$ "
export RPROMPT="XENTEK"
export XDEBUG_CONFIG="idekey=xentek"
export PERL5LIB="/opt/local/lib/perl5/site_perl/5.8.9"

# HELPFUL
alias hosts='mate /etc/hosts'
alias zshrc='mate -w ~/.zshrc && source ~/.zshrc'
alias flushdns='dscacheutil -flushcache'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias sshkey='cat ~/.ssh/id_rsa.pub | pbcopy'
alias wpfetch='wget http://wordpress.org/latest.tar.gz && tar xzvf ./latest.tar.gz && rm -f ./latest.tar.gz'
alias wptrunk='svn export http://svn.automattic.com/wordpress-mu/trunk/ && mv trunk/* . && rm -rf trunk'
alias dbg='open /Applications/MacGDBp.app'
alias imsize='sips -g pixelWidth -g pixelHeight'

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
alias asa="ssh -i /Users/xentek/.ssh/asa_slice -p 16885 deploy@173.203.89.165"
alias asaqa="ssh -i /Users/xentek/.ssh/asa_slice -p 16885 deploy@184.106.206.94"

# SSH - Clients
alias adsblog='ssh 209.20.76.164'

# DNS
alias syncdns="cd /Users/xentek/Sites/dns-new/dns && rm -rf /Users/xentek/Sites/dns-new/dns/env.xentek /Users/xentek/Sites/dns-new/dns/env.slave && /Users/xentek/Sites/dns-new/dns/compile-dns.pl xentek && /Users/xentek/Sites/dns-new/dns/compile-dns.pl slave && rsync -avHS env.xentek 67.23.32.231:~ && rsync -avHS env.slave 174.143.252.196:~"

# Machine Specific Mods
if [[ -s /Users/xentek/.localrc ]] ; then source /Users/xentek/.localrc ; fi

# Local Dev

# Ruby
if [[ -s /Users/xentek/.rvm/scripts/rvm ]] ; then source /Users/xentek/.rvm/scripts/rvm ; fi

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

# MySQL
alias mysql='/opt/local/bin/mysql5'
alias mysqladmin='/opt/local/bin/mysqladmin5'
alias mysqlctl='sudo /opt/local/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper'
alias mysqlrestart='sudo /opt/local/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper restart'

# Apache
alias apacherestart='sudo /opt/local/apache2/bin/apachectl restart'
alias vhosts='mate -w /opt/local/apache2/conf/vhosts'

# PHP
alias phpini='mate -w /opt/local/etc/php5/php.ini && sudo /opt/local/apache2/bin/apachectl restart'

# Python
export PYTHONSTARTUP=/Users/xentek/.pystartup

#TOOLS
alias yuicompress='java -jar ~/bin/yuicompressor-2.4.2.jar'
alias closurecompiler='java -jar ~/bin/compiler.jar'