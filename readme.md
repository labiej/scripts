# Scripts

## Overview

This repository contains some scripts I regularly use. Below I'll list their purpose and usage.

* __AccesPoint.script__
Useful to turn a computers wifi card into an access point for other mobile devices. My usage was limited to construct a local wifi network for my smartphone, effectively sharing the ethernet connection
* __alarm.sh__
Using linux' rtcwake command I used my laptop as an alarm clock for a while. It wakes up at a specified time and plays a random song from the music folder.
* __bulkRename.sh__
My digital camera uses JPG as extension for pictures. Since all extensions should be lowercase if you ask me I decided to build a bulk renaming tool.
I expanded the use to any extension that can be converted to whatever you like (statically).

With a single argument the extension will be changed to lowercase while two arguments allow more general constructions.
Original usage
```
./bulkRename.sh JPG
```
or its equivalent
```
./bulkRename.sh JPG jpg
```

The expanded script allows for changing more annoying extensions like `.text` to `.txt`.
* __find_command.sh__
One of the more useful scripts for searching the history of your terminal. Several options keep the output tractable.
* __mplayerWrapper.sh__
Used to start the command line based mediaplayer mplayer with a playlist. Related to another project that should become available in time.
* __pdfextractor.sh__
Extract a range of pages from a pdf and save as a new pdf.
* __swapUsage.sh__
When my swap was full all the time I needed a tool to give somewhat reliable information on the processes using the swap.
* __todo.sh__
A small and extremely simple tool to open a text based to-do list. It opens the file in kwrite and places the pointer at the current day.

## Details on usage

### AccesPoint.script

This script has 1 input argument. Which can take 2 valid options.
* start
* stop

It needs to be run with root privileges (it uses `iptables`, `ifconfig` and `dhcpd` all of which are located in `/usr/sbin/` or `/sbin/`).

To use the script you'll need hostapd (obviously) but inside the script you'll need to specify the names for the ethernet and wireless network devices. You can specify the IP address the computer will have in the small LAN network you're effectively making.

Network settings like an SSID, password and security are located in `/root/hostapd.conf`.

### alarm.sh

This script takes but a single argument, the time you want to wake up.
Since it uses the `date` command you'll want to be careful when you run the script. If you run it before midnight you need to specify the argument as e.g. 'tomorrow 08:00'. After midnight you can just run it with 08:00.

### find_command.sh

This script takes one mandatory argument, a part of a command you can't quite remember.
Usage
```
./find_command.sh "search string"
```

In this usage it'll print out all commands in your bash history containing "search string" together with its linenumber in said history file. Next it requires user input specifying which command you are looking for. If you give a non-numeric value you'll exit the script.

The script also assumes that any number not matching the line numbers in the results is a mistake and exits as well.

If the number is valid it will print the command once more and copy it to the clipboard.

The second optional argument limits the number of results listed. This is useful when looking for a very common string while you know you ran the command you're looking for recently. It then only prints the last `n` commands containing search string.
Usage
```
./find_command.sh "search string" n
```

### mplayerWrapper.sh

Takes a single argument, the directory containing music you want to play as a shuffled playlist. Starts mplayer in slave mode listening to commands passed through a fifo which can be set up in the `pipe` variable of the script.

### pdfextractor.sh

Takes 3 mandatory arguments.
The usage is self explanatory
```
./pdfextractor.sh start end file.pdf
```

This will create a pdf file starting at page "start" and ending at page "end" from the original file `file.pdf`. The output file is `file_p{start}-p{end}.pdf`.

### swapUsage.sh

Runs out-of-the-box, credits go to Erik Ljungstrom, Mikko Rantalainen and Mark Methot.

### todo.sh

This script only needs to be set up. Inside the script you specify the location of the to-do list.
The to-do list will look something like
```
Sunday

-   Task

Monday

-   Task 1
-   Task 2

Tuesday

-   Task 1
-   Task 2

Wednesday

-   Task 1
-   Task 2

Thursday

-   Task 1
-   Task 2

Friday

-   Task 1
-   Task 2

Saturday

-   Task 1
-   Task 2
```
