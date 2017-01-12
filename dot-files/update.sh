#!/bin/bash

BASEDIR=$(dirname $0)
MSG_ENABLE_FIRST='You must run the enable commande first! For more information check the README file'

# Check if the ~/bin/dotfiles directory exists
if [ ! -d ~/bin ]; then
    echo -n $MSG_ENABLE_FIRST
elif [ ! -d ~/bin/dotfiles ]; then
    echo -n $MSG_ENABLE_FIRST
else
    rm -f ~/bin/dotfiles/bash/env
    rm -f ~/bin/dotfiles/bash/aliases-common

    # Copy the dot files to bin dotfiles directory
    cp -Rf $BASEDIR/* ~/bin/dotfiles/
    rm ~/bin/dotfiles/enable.sh
    rm ~/bin/dotfiles/update.sh

    # Create private aliases file sample if there's no file ~/bin/dotfiles/common/private-aliases
    if [ -L ~/bin/dotfiles/bash/private-aliases.zdf ]; then #file exists
        mv -f ~/bin/dotfiles/bash/private-aliases.zdf ~/bin/dotfiles/common/private-aliases.zdf
    elif [ ! -f ~/bin/dotfiles/common/private-aliases.zdf ]; then
        mv ~/bin/dotfiles/common/private-aliases-sample.zdf ~/bin/dotfiles/common/private-aliases.zdf
    fi

    # Link mybashit to the home bashrc
    if [ -f ~/.bashrc ]; then # file exists & not symlink
        mv -f ~/.bashrc ~/.bashrc.bak
    elif [ -L ~/.bashrc ]; then #file exists & it is symlink
        rm ~/.bashrc
    fi
    ln -s ~/bin/dotfiles/bash/mybashit.bashrc ~/.bashrc


    # Copy the gitconfig file to the home directory
    # if [ -f ~/.gitconfig ]; then
    #     mv -f ~/.gitconfig ~/.gitconfig.bak
    # fi
    # cp ~/bin/dotfiles/git/.gitconfig ~

    # Copy the zshrc file to the home directory & link the theme
    if [ -f ~/.zshrc ]; then
        mv -f ~/.zshrc ~/.zshrc.bak
    fi
    cp -f ~/bin/dotfiles/zsh/myohmyzsh.zshrc ~
    mv ~/myohmyzsh.zshrc ~/.zshrc
    rm -f ~/.oh-my-zsh/themes/agnosterzak.zsh-theme
    ln -s ~/bin/dotfiles/zsh/mytheme.zdf ~/.oh-my-zsh/themes/agnosterzak.zsh-theme

    # Apply the changes on the console
    echo 'use the command "update_rcs" to complete the update process'
    # if [ $(which $SHELL | grep -c "bash$") -gt 0 ]; then
    #     . ~/.bashrc
    # elif [ $(which $SHELL | grep -c "zsh$") -gt 0 ]; then
    #     . ~/.zshrc
    # fi
fi
