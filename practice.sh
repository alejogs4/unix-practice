#!/bin/bash
# Main menu
COMMANDS_MENU="1"
USERS_MENU="2"
FILE_SYSTEM_MENU="3"
EXIT_MENU="9"

# COMMANDS_MENU
SYSTEM_HOUR="1"
CURRENT_PATH="2"
CHANGE_PASSWORD="3"
FREE_SPACE="4"
FILLED_SPACE="5"
SHOW_ACTIVE_PROCESSES="6"

MAIN_MENU_OPTIONS=($COMMANDS_MENU $USERS_MENU $FILE_SYSTEM_MENU $EXIT_MENU)

function printMainMenu() {
  echo "Selecciona alguna de las siguientes opciones:"
  echo "1: Comandos generales"
  echo "2: Usuarios"
  echo "3: Sistema de archivos"
  echo "9: Terminar"
}

function printCommandsMenu() {
  echo "Selecciona alguna de las siguientes opciones sobre tu sistema:"
  echo "1: Hora del sistema"
  echo "2: Ruta actual"
  echo "3: Cambiar contraseña"
  echo "4: Mostrar disco libre"
  echo "5: Mostrar disco ocupado"
  echo "6: Visualizar procesos activos"
  echo "9: Regresar"
}

function executeCommandsMenu() {
  printCommandsMenu
  read selectedMenu

  while [[ ! "$selectedMenu" -eq $EXIT_MENU ]]; do
    if [[ "$selectedMenu" -eq $SYSTEM_HOUR ]]; then
      date
    fi
    if [[ "$selectedMenu" -eq $CURRENT_PATH ]]; then
      pwd
    fi
    if [[ "$selectedMenu" -eq $CHANGE_PASSWORD ]]; then
      pwd
    fi

    sleep 1
    printCommandsMenu
    read selectedMenu
  done
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
      executeCommandsMenu
    fi
  done  
}

main