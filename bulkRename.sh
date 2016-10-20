#!/bin/bash

# Rename all *.txt to *.text

numargs=$#

if [ $numargs -eq 0 ]
then
    echo 'You need at least one argument specifying the target extension.'
    exit 1
fi

extbefore=$1

if [ $numargs -eq 1 ]
then
    extafter=$(echo $1 | tr '[:upper:]' '[:lower:]')
    echo "Converting files with extension $extbefore to extension ${extafter}."
else
    extafter=$2
    echo "Converting files with extension $extbefore to extension ${extafter}."
fi

files=$(find ./ -maxdepth 1 -name "*.${extbefore}")

if [ ${#files[@]} -gt 0 ]
then
    for f in $files
    do
        mv -- "$f" "${f%.$extbefore}.$extafter"
    done
else
    echo "Nothing to do"
fi
