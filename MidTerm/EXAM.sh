#!/bin/bash

## Assignment: Midterm
## Author: Brendon Egolf (begolf123@gmail.com)
## Version: 0.0.1
## Purpose: get a 100% on the Midterm

declare -a commands
declare -A deleteFile="$HOME/DeLeTe.Me"
declare -A profile="$HOME/.bash_profile"

main() {
  clear
  # getHomeDirectory
  printLsDescription
  printAbsVsRelPathnameHelp
  makeFile
  initializeCommandArray
  writeFile "$deleteFile"
  readFile "$deleteFile"
  writeFile "$profile"
  findFiles
  moveToHome
  deleteFile
}

getHomeDirectory() {
  read -p "What is your home directory? " homeDirectory
  if [[ ! "$homeDirectory" == "$HOME" ]]; then
    clear
    echo "incorrect."
    sleep 1
    clear
    getHomeDirectory
  fi
  echo ""
}

printLsDescription() {
  echo "To learn about ls -l, use the following link"
  echo "http://www.livefirelabs.com/unix_commands/the-unix-ls-l-command-explained.htm"
  echo ""
}

printAbsVsRelPathnameHelp() {
  echo "To learn about absolute and relative pathnaes, use the following link"
  echo "http://www.linuxnix.com/abslute-path-vs-relative-path-in-linuxunix/"
  echo ""
}

makeFile() {
  touch $deleteFile
}

writeFile() {
  outFile="$1"
  # echo "writing to $outFile"
  for (( i=0; i < ${#commands[@]}; i++ ))
  do
    echo ${commands[i]} >> $outFile
  done
}

readFile() {
  commands=()
  inFile="$1"
  declare -i lineNumber=0
  while read command
  do
    commands[$lineNumber]=$command
    (( lineNumber++ ))
  done < $inFile
}

initializeCommandArray() {
  commands=( "umask 117" "alias cls='clear'" "set noclobber" )
}

findFiles() {
  grep -ril "clob" "$HOME"
}

main

