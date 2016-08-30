#!/bin/bash

#Open todo-list at todays tasks

location=/home/joris/Tasks.txt 

opened=`ps -aux | grep -c "$location"`

if [ "$opened" = 1  ]; then

    dag=`date +"%A"`
    line=$(grep -i -n "$dag" "$location" | head -c 2)
    kwrite -l "$line" $location &
else
    echo "Todo list is already opened!"
fi


