# ls commands
alias disks='df -h'
alias du="du -h"
alias memory='free -m'
alias network="netstat -ap"
alias whatsmyip="curl -s checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias servstats='sudo service --status-all'
alias process='top'
alias top_process="ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
alias destroy='kill -9'

alias ls='ls -F --color=always'
alias dir='dir -F --color=always'
alias ll='ls -lh'
alias lla='ll -a'

alias cp='cp -iv'
#alias rm='rm -i'
alias mv='mv -iv'

alias grep='grep --color=auto -in --exclude-dir ".svn" --exclude-dir ".git" --exclude tagsi'

alias ..='cd ..'
alias back='cd -'
alias cc='clear'


# Aptitude
alias agi="apt-get install"
alias agua="apt-get update"
alias agup="apt-get upgrade"
alias aguap="apt-get update && apt-get upgrade"
alias adel=" apt-get remove"
alias asearch="apt-cache search"


# Archive
alias untar="tar xvf"
alias ungz="gunzip"
alias unzip2="bzip2 -d"
alias untargz="tar zxvf"
alias untarbz1="tar jxvf"
alias ungz2="bunzip2 -k"


# git commands
alias gfo='git fetch origin'
alias gpo='git pull origin'
alias gso='git push origin'
alias gco='git checkout'
alias glg='git log --oneline -10 --pretty=format:"%h - %an (%ar) : %s"'
alias gll='git lga'
alias gcm='git commit -m'
alias gucm='git uncommit'
alias gust='git unstage'
alias gudo='git uncommithard'
alias gpr='git pull --rebase'
alias gb='git branch'
alias gba='git branch -a'
alias gst='git status -s'
alias grb='git rebase'
alias gup_master='gco master && gfo && gpo master'


# edit hosts and vhosts through xampp
alias xampp='sudo xampp'
alias xampp_start='xampp start'
alias xampp_stop='xampp stop'
alias xampp_restart='xampp restart'
alias hosts='sudo gedit /etc/hosts'
alias vhosts='sudo gedit /opt/lampp/etc/extra/httpd-vhosts.conf'
# alias logg='tail -f /var/log/apache2/error.log'
alias logg='tail -f /opt/lampp/logs/error_log'


# PHP
alias phpini_cli='sudo gedit /etc/php5/cli/php.ini'
alias phpini_xampp='sudo gedit /opt/lampp/etc/php.ini'


# Composer
alias get_composer='curl -sS https://getcomposer.org/installer | php'
alias composer='php composer.phar'
alias composer_update='composer self-update'


# Symfony1.4 commands
alias symfony='php symfony'
alias sf_project='php lib/vendor/symfony/symfony1/data/bin/symfony generate:project' #My symfony 1.4's files are always placed on lib/vendor directory of the project
alias sf_app='symfony generate:app'
alias sf_module='symfony generate:module'
alias sf_schema='symfony doctrine:build-schema'
alias sf_model='symfony doctrine:build-model'
alias sf_forms='symfony doctrine:build-forms'
alias sf_classes='symfony doctrine:build --all-classes'
alias sf_build_all='symfony doctrine:build --all --no-confirmation'
alias sf_cc='symfony cc'
alias sf_clear='sf_cc'
alias sf_create_cache='mkdir cache && chmod -R 777 cache'
alias sf_create_log='mkdir log && chmod -R 777 log'


# Symfony2 commands
alias sf2_console='php app/console'
alias sf2_cc='sudo rm -rf app/cache/dev/* && sudo chmod -R 777 app/cache/ app/logs/'
alias sf2_fix='sudo chown -R zakaria:zakaria app/cache/ app/logs/'
alias sf2_clear='sf2_cc'
alias sf2_cc_fix='sf2_cc && sf2_fix'


# install latest node & npm
alias get_latest_npm='sudo npm cache clean -f && sudo npm install -g n && sudo n stable'


# Usefull fixes
alias grunt_watch_fix='echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p' #This is to fix grunt watch task with the warning watch ENOSPC
