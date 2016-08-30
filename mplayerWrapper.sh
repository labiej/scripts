#!/bin/bash

pipe=/tmp/mplayer-ctrl
location=$1

if [[ ! -p $pipe ]]; then
    mkfifo $pipe
fi
if [[ ! -d $location ]]; then

    location="/home/joris/Music/"
    echo "$location"
fi

printf "" > /srv/www/htdocs/playlist.txt

mplayer -slave -quiet -demuxer lavf -novideo -input file=$pipe -msgcolor -shuffle -playlist <(find $location -name *.mp3 -type f) #>/tmp/mplayer-out

