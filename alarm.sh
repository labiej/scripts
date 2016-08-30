#!/bin/bash


#Generate timestamp for wake up time
#The time is specified as tomorrow at xx:xx which is the argument in $1
time=$((`date +%s -d "$1"`)) 

#Confirmation of the command
echo "Dry run below"
echo

sudo rtcwake --dry-run -m mem -l -t $time

echo

read -p "Are you sure this is correct? (Y/n) " -n 1 -r
echo    # (optional) move to a new line


if [[ $REPLY =~ ^[Yy]$ ]]
then


    #Go to sleep
    sudo rtcwake -m mem -l -t $time
    #Select random song in the Music map
    ## Note-to-self: make variable path a thing

    song="$(ls ~/Music/ |sort -R |tail -n 1)"

    #Set volume to 80 (or whatever)

    #pactl set-sink-volume 1 95%

    #Play The selected song

    mplayer -loop 0 -volume 90 ~/Music/$song
    #    playAll /run/media/joris/External_Drive_1/music/Breakdown_Of_Sanity/

fi
