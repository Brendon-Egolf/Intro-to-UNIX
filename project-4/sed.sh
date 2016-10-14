#!/bin/bash

sed -i /home/phonelist.csv 's/[0-9][0-9][0-9]\([0-9][0-9][0-9]\)\([0-9][0-9][0-9][0-9]\)/\1-\2/'
sed -i /home/phonelist.csv 's/@[^,]*/@starhealth.org/'
