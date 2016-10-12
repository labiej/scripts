#!/bin/bash

# Argument: 1. part of command you're looking for
#           2. highest number of commands containing argument one to display

# For example ./find_command.sh youtube-dl to find how to play youtube videos in mplayer (original use of the command on line XXX)

#Append commandlist of current session to $HISTFILE

numargs=$#
HISTFILE=~/.bash_history

KRUNNER=~/.config/krunnerrc



if [ $numargs -eq 0 ]
then
    echo 'You need at least a search word'
    exit 1
fi

phrase="$1"


if [ $numargs -eq 2 ] && [ $2 -ge 1 ]
then

    results="$(grep -n $phrase $HISTFILE  |  tail -n $2)"
else

    results="$(grep -n $phrase $HISTFILE)"
fi

echo -e `printf "%q" "$results"`


read -r -p "Which line contains your desired command? (use a letter to quit)`echo $'\n> '`" linenumber

# Check input

re=^[0-9]+$
if ! [[ $linenumber =~ $re  ]] ; then
    echo "Exit without copying command" >&2;
    exit 1
elif [ $(echo "$results" | grep /^"$linenumber"\s+/ | wc -l) -eq 0  ]
then
    echo "Invalid line number, try again" >&2;
    exit 1
fi

echo "Copying command to clipboard"

echo `sed "${linenumber}q;d" $HISTFILE`

sed "${linenumber}q;d" $HISTFILE | tr -d '\n' | xclip -selection clipboard
