#!/bin/bash



for i in $(eval echo {1..$1})
do
    xdotool click 1
    sleep $(eval echo $2)
done
