BASEDIR=$(dirname $0)

# Check if the ~/bin/dotfiles directory exists
if [ ! -d ~/bin ]; then
    mkdir ~/bin
    mkdir ~/bin/dotfiles
elif [ ! -d ~/bin/dotfiles ]; then
    mkdir ~/bin/dotfiles
fi

# Copy the dot files to bin dotfiles directory
cp -Rf $BASEDIR/* ~/bin/dotfiles/
rm ~/bin/dotfiles/enable.sh

# Link mybashit to the home bashrc
if [ -f ~/.bashrc ]; then # file exists & not symlink
    mv -f ~/.bashrc ~/.bashrc.bak
elif [ -L ~/.bashrc ]; then #file exists & it is symlink
    rm ~/.bashrc
fi
ln -s ~/bin/dotfiles/bash/mybashit.bashrc ~/.bashrc

# Copy the gitconfig file to the home directory
if [ -f ~/.gitconfig ]; then
    mv -f ~/.gitconfig ~/.gitconfig.bak
fi
cp ~/bin/dotfiles/git/.gitconfig ~

# Copy the zshrc file to the home directory & link the theme
if [ -f ~/.zshrc ]; then
    mv -f ~/.zshrc ~/.zshrc.bak
fi
cp -f ~/bin/dotfiles/zsh/myohmyzsh.zshrc ~
mv ~/myohmyzsh.zshrc ~/.zshrc
rm -f ~/.oh-my-zsh/themes/agnosterzak.zsh-theme
ln -s ~/bin/dotfiles/zsh/mytheme ~/.oh-my-zsh/themes/agnosterzak.zsh-theme
