#!/bin/bash

## Assignment: Project 5
## Author: Brendon Egolf (begolf123@gmail.com)
## Version: 0.0.1
## Purpose: Write a menu for department junior admins

declare -A currentMenu
declare -A menuName="main-menu"
declare -i currentSelection
declare -ir EXIT_NUMBER=0
declare subMenu=false
declare command=false

main() {
  clear
  currentSelection=-1
  loadMenu
  while [[ "$currentSelection" -ne "$EXIT_NUMBER" ]] || [[ $subMenu = true ]]
  do
    if [[ $command = false ]]; then
      clear
      printMenu
      getSelection
      updateMenuName
      loadMenu
    else
      clear
      printCommand
    fi
  done
}

loadMenu() {
  currentMenu="$(cat $menuName)"
}

printCommand() {
  echo -e "\nComing soon!\n"
  command=false
  sleep 1
}

printHeader() {
  cat header
  echo ""
}

printFooter() {
  cat footer
  echo ""
}

printMenu() {
  echo ""
  printHeader
  echo -e "$currentMenu\n"
  printFooter
}

getSelection() {
  read -p "Please make a selection: " currentSelectionInput
  if [[ "$currentSelectionInput" =~ ^[a-zA-Z] ]] || [[ -z "$currentSelectionInput" ]]; then
    echo -e "\nInvalid input\n"
    getSelection
  fi
  currentSelection="$currentSelectionInput"
}

updateMenuName() {
  if [[ "$menuName" == "main-menu" ]]; then
    subMenu=false
  else
    subMenu=true
  fi

  if [[ $subMenu = true ]] && [[ "$currentSelection" -gt 0 ]]; then
    command=true
  else
    menuName=$(echo "$currentMenu" | grep "^$currentSelection" )
    menuName=$(echo "$menuName" | grep -o "[a-zA-Z].*$")
    menuName=$(echo "${menuName// /-}")
    menuName=$(echo "${menuName,,}")
  fi

  if [[ "$currentSelection" -eq 0 ]]; then
    menuName=$(echo "main-menu")
  fi

  if [[ -z "$menuName" ]]; then
    clear
    echo -e "\nInvalid selection\n"
    menuName="main-menu"
    sleep 1
  fi

}

main

