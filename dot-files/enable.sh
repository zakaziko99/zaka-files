#local pdir=$(pwd)

cp -R ./* ~/bin/dotfiles/
rm ~/bin/dotfiles/enable.sh

ln -s ~/bin/dotfiles/bash/mybashit.bashrc ~/.bashrc

cp -f ~/bin/dotfiles/git/.gitconfig ~

cp ~/bin/dotfiles/zsh/myohmyzsh.zshrc ~
mv -f ~/myohmyzsh.zshrc ~/.zshrc
ln -s ~/bin/dotfiles/zsh/mytheme ~/.oh-my-zsh/themes/agnosterzak.zsh-theme
