#!/bin/bash

## Author: Brendon Egolf (begolf123@gmail.com)
## Version: 0.0.1
## Purpose: File I/O and multidimensional arrays in a language that was never meant to do
## anything in a remotely simple way

IFS=","

declare inFile="data.csv"
declare -a lastNames
declare -a firstNames
declare -A ages
declare -A people

main() {
    altReadFile
    # printMdArray
    # printAges
    printTotalEligible
    exit 0
}

printTotalEligible() {
  declare -ir ELIGIBLE_AGE=62
	declare ROWS=6
  declare totalEligible=0
  for (( i=0; i < ROWS; i++ )) {
		ages[$i]=$(echo ${ages[$i]}|tr -d '\t\r\n ')
		declare -i age=${ages[$i]}
		if [ $age -gt $ELIGIBLE_AGE ] 
		then
			(( totalEligible++ ))
		fi
	}
	echo "Total eligible: $totalEligible"
}

altReadFile() {
	declare -i lineNumber=0
	declare -ir ROWS=6
	declare -ir COLUMNS=3
	while read lastName firstName age
	do
		for (( i=0; i < COLUMNS; i++ )) {
				if [[ "$i" -eq "0" ]]
				then
					people[$lineNumber,$i]=$lastName
				elif [[ "$i" -eq "1" ]]
				then
					people[$lineNumber,$i]=$firstName
				else
					people[$lineNumber,$i]=$age
          ages[$lineNumber]=$age
				fi
		}
		(( lineNumber++ ))
	done < $inFile
}

printMdArray() {
	declare -ir ROWS=6
	declare -ir COLUMNS=3
	for (( i=0; i < ROWS; i++ )) {
		for (( j=0; j < COLUMNS; j++ )) {
			echo "${people[$i,$j]}"
		}
	}
}

printAges() {
	declare -ir ROWS=6
  for (( i=0; i < ROWS; i++ )) {
    echo "${ages[$i]}"
  }
}


main
