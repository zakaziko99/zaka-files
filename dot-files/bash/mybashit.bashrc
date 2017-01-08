#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="/home/zakaria/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='modern'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Custom top Path Bash
if [ -f ~/.bashrc.path ]; then
    source ~/.bashrc.path
fi

# Load Bash It
source $BASH_IT/bash_it.sh

# include my personnal customisation bashes
source ~/bin/dotfiles/common/env.zdf
if [ -f ~/bin/dotfiles/common/private-aliases.zdf ]; then
    source ~/bin/dotfiles/common/private-aliases.zdf
fi
source ~/bin/dotfiles/bash/aliases-git.zdf
for file in ~/bin/dotfiles/common/aliases/*.zdf
do
    source "${file}"
done

# Custom top layer Bash
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
