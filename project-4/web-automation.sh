#!/bin/bash

/home/links
^Z
sleep 60 ; sleep 60 ; ls -alR / > flist &
fg
^Z
killall links
ps aux |grep sleep
