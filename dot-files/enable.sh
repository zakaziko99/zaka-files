#local pdir=$(pwd)

cp -R ./* ~/bin/dotfiles/
rm ~/bin/dotfiles/enable.sh

ln -s ~/bin/dotfiles/bash/mybashit.bashrc ~/.bashrc

ln -s ~/bin/dotfiles/zsh/myohmyzsh.zshrc ~/.zshrc
ln -s ~/bin/dotfiles/zsh/mytheme ~/.oh-my-zsh/themes/agnosterzak.zsh-theme
