#!/bin/bash
# Main menu
COMMANDS_MENU="1"
USERS_MENU="2"
FILE_SYSTEM_MENU="3"
EXIT_MENU="9"
MAIN_MENU_OPTIONS=($COMMANDS_MENU $USERS_MENU $FILE_SYSTEM_MENU $EXIT_MENU)

function printMainMenu() {
  echo "Selecciona alguna de las siguientes opciones:"
  echo "1: Comandos generales"
  echo "2: Usuarios"
  echo "3: Sistema de Sarchivos"
  echo "9: Terminar"
}

function main() {
  while true; do
    printMainMenu
    read selectedOption

    while [[ ! " ${MAIN_MENU_OPTIONS[@]} " =~ " ${selectedOption} " ]]; do
      printMainMenu
      read selectedOption
    done

    if [[ "$selectedOption" -eq $COMMANDS_MENU ]]; then
      bash commands.sh
    fi
    if [[ "$selectedOption" -eq $USERS_MENU ]]; then
      bash users.sh
    fi
    if [[ "$selectedOption" -eq $FILE_SYSTEM_MENU ]]; then
      bash file_system.sh
    fi
    if [[ "$selectedOption" -eq $EXIT_MENU ]]; then
      exit
    fi
  done  
}

main