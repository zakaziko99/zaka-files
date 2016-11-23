#!/bin/bash

BASEDIR=$(dirname $0)
CURRENT_PWD=$(pwd)
cd ~
HOME_PWD=$(pwd)
cd $CURRENT_PWD

unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
    TARGET_ST3_SNIPPETS="$HOME_PWD/.config/sublime-text-3/Packages/User"
elif [[ "$unamestr" == 'FreeBSD' ]]; then
    TARGET_ST3_SNIPPETS='~/Library/Application Support/Sublime Text 3/Packages/User'
fi

if [ -d $TARGET_ST3_SNIPPETS ]; then
    yes | \cp -R $BASEDIR/snippets-zakaria $TARGET_ST3_SNIPPETS
    # \cp is to unalias temporarily the cp -i command
else
    echo "Can't find the sublime text 3 user packages folder"
fi
