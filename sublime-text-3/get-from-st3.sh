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
    if [[ -n $1 ]]; then
        if [ -f $TARGET_ST3_SNIPPETS/snippets-zakaria/$1 ]; then
            TEMP_FOLDER_PATH=''
            CREATE_FOLDER_STATE=0
            export IFS="/"
            for vFolder in $1; do
                if [[ "$TEMP_FOLDER_PATH" == '' ]]; then
                    TEMP_FOLDER_PATH=$vFolder
                else
                    TEMP_FOLDER_PATH="$TEMP_FOLDER_PATH/$vFolder"
                fi

                if [ -d "$TARGET_ST3_SNIPPETS/snippets-zakaria/$TEMP_FOLDER_PATH" ]; then
                    echo "$BASEDIR/snippets-zakaria/$TEMP_FOLDER_PATH would be created"
                    if [[ $CREATE_FOLDER_STATE -eq 1 ]]; then
                        mkdir "$BASEDIR/snippets-zakaria/$TEMP_FOLDER_PATH"
                    elif [ ! -d "$BASEDIR/snippets-zakaria/$TEMP_FOLDER_PATH" ]; then
                        CREATE_FOLDER_STATE=1
                        mkdir "$BASEDIR/snippets-zakaria/$TEMP_FOLDER_PATH"
                    fi
                fi
            done

            cp "$TARGET_ST3_SNIPPETS/snippets-zakaria/$1" "$BASEDIR/snippets-zakaria/$1"
        else
            echo "The file '$TARGET_ST3_SNIPPETS/snippets-zakaria/$1' does not exist !"
        fi
    else
        echo "You must provide the relative path from snippets-zakaria folder"
        echo "with the name of the snippet to copy from Sublime Text 3"
    fi
else
    echo "Can't find the Sublime Text 3 user packages folder"
fi
