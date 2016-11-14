BASEDIR=$(dirname $0)

unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
    TARGET_ST3_SNIPPETS='~/.config/sublime-text-3/Packages/User'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
    TARGET_ST3_SNIPPETS='~/Library/Application Support/Sublime Text 3/Packages/User'
fi

if [ -d $TARGET_ST3_SNIPPETS ]; then
    # \cp is to unalias temporarily the cp -i command
    yes | \cp -R $BASEDIR/snippets-zakaria $TARGET_ST3_SNIPPETS
else
    echo "Can't find the sublime text 3 user packages folder"
fi
