#!/bin/bash

BASEDIR=$(dirname $0)
CURRENT_PWD=$(pwd)
cd ~
HOME_PWD=$(pwd)
cd $CURRENT_PWD

# Check if the ~/bin/dotfiles directory exists
if [ ! -d $HOME_PWD/bin ]; then
    mkdir $HOME_PWD/bin
    mkdir $HOME_PWD/bin/dotfiles
elif [ ! -d $HOME_PWD/bin/dotfiles ]; then
    mkdir $HOME_PWD/bin/dotfiles
fi

if [ ! -d $HOME_PWD/bin/backups ]; then
    mkdir $HOME_PWD/bin/backups
fi

# Copy the dot files to bin dotfiles directory
cp -Rf $BASEDIR/* $HOME_PWD/bin/dotfiles/
rm $HOME_PWD/bin/dotfiles/enable.sh
rm $HOME_PWD/bin/dotfiles/update.sh

# Link mybashit to the home bashrc
if [ -f $HOME_PWD/.bashrc ]; then # file exists & not symlink
    mv -f $HOME_PWD/.bashrc "$HOME_PWD/bin/backups/$(date +%Y%m%d%H%M%S).bashrc.bak"
elif [ -L $HOME_PWD/.bashrc ]; then #file exists & it is symlink
    rm $HOME_PWD/.bashrc
fi
ln -s $HOME_PWD/bin/dotfiles/bash/mybashit.bashrc $HOME_PWD/.bashrc

# Create private aliases file sample if there's no file ~/bin/dotfiles/common/private-aliases
if [ -L $HOME_PWD/bin/dotfiles/bash/private-aliases.zdf ]; then #file exists
    mv -f $HOME_PWD/bin/dotfiles/bash/private-aliases.zdf $HOME_PWD/bin/dotfiles/common/private-aliases.zdf
elif [ ! -f $HOME_PWD/bin/dotfiles/common/private-aliases.zdf ]; then
    mv $HOME_PWD/bin/dotfiles/common/private-aliases-sample.zdf $HOME_PWD/bin/dotfiles/common/private-aliases.zdf
fi

# Copy the gitconfig file and its dependencies to the home directory
if [ -f $HOME_PWD/.gitconfig ]; then
    mv -f $HOME_PWD/.gitconfig "$HOME_PWD/bin/backups/$(date +%Y%m%d%H%M%S).gitconfig.bak"
fi
if [ -f $HOME_PWD/.global_gitignore ]; then
    mv -f $HOME_PWD/.global_gitignore "$HOME_PWD/bin/backups/$(date +%Y%m%d%H%M%S).global_gitignore.bak"
fi
cp $HOME_PWD/bin/dotfiles/git/.gitconfig $HOME_PWD
cp $HOME_PWD/bin/dotfiles/git/.global_gitignore $HOME_PWD

# Copy the zshrc file to the home directory & link the theme
if [ -f $HOME_PWD/.zshrc ]; then
    mv -f $HOME_PWD/.zshrc "$HOME_PWD/bin/backups/$(date +%Y%m%d%H%M%S).zshrc.bak"
fi
if [ ! -f $HOME_PWD/.zshrc.path ]; then
    cp -f $HOME_PWD/bin/dotfiles/zsh/path.zshrc $HOME_PWD
    mv $HOME_PWD/path.zshrc $HOME_PWD/.zshrc.path
fi
cp -f $HOME_PWD/bin/dotfiles/zsh/myohmyzsh.zshrc $HOME_PWD
mv $HOME_PWD/myohmyzsh.zshrc $HOME_PWD/.zshrc
rm -f $HOME_PWD/.oh-my-zsh/themes/agnosterzak.zsh-theme
ln -s $HOME_PWD/bin/dotfiles/zsh/mytheme.zdf $HOME_PWD/.oh-my-zsh/themes/agnosterzak.zsh-theme
