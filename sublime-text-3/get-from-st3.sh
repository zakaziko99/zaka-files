BASEDIR=$(dirname $0)

unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
    TARGET_ST3_SNIPPETS='~/.config/sublime-text-3/Packages/User'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
    TARGET_ST3_SNIPPETS='~/Library/Application Support/Sublime Text 3/Packages/User'
fi

if [ -d $TARGET_ST3_SNIPPETS ]; then
    if [[ -n $1 ]]; then
        if [ -f $TARGET_ST3_SNIPPETS/$1.sublime-snippet ]; then
            cp $TARGET_ST3_SNIPPETS/$1.sublime-snippet $BASEDIR/snippets-zakaria
        else
            echo "The file '$TARGET_ST3_SNIPPETS/$1.sublime-snippet' does not exist !"
        fi
    else
        echo "You must provide the name of the snippet to copy from Sublime Text 3"
    fi
else
    echo "Can't find the Sublime Text 3 user packages folder"
fi
