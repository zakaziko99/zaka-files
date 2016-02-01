# zaka-files
the most important config files for workflow

## My Dot files

### Bash files (based on bash-it)
  * Environment ($PATH)
  * Aliases (common, Git, ...)
  * Bashrc

### Git config files
  * .gitconfig file

### Zsh files (based on oh-my-zsh)
  * Theme (agnosterzak)
  * Zshrc

#### Theme (agnosterzak)
Based on agnoster theme by oh-my-zsh (must install & set one of the powerline fonts to work fine)

added to the prompt:

  * Battery life
  * Big info display on Git prompt
    + has upstream info
    + branch or commit info
    + number of commits ahead on the upstream
    + number of commits behind on the upstream
    + number of untracked files
    + number of added files from the untracked ones
    + number of deleted files
    + number of staged files from the deleted ones
    + number of modified & files
    + number of staged files from the modified ones including those renamed
    + number of stash stored
    + Green background if there is no untracked, deleted or modified files, and no stashes
    + Magenta Background if there is no untracked, deleted or modified files, but have stashes
    + Yellow background if there is untracked or staged files but no deleted or modified files
    + Red background if there is deleted or modified files

### Enable shell script file
Run the enable.sh to copy the dotfiles into ~/bin/dotfiles & create link files to .bashrc, .zshrc & zsh theme

## Sublime text files
  * Preferences
  * Key shortcuts
  * Snippets
    - Polymer Snippets (HTML & Javascript)
    - Init Functions (Javascript)

## Other files & some useful things
  * My Linux Terminal scheme (Based on Solaris Dark scheme)
