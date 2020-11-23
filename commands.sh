#!/bin/bash

# COMMANDS_MENU
SYSTEM_HOUR="1"
CURRENT_PATH="2"
CHANGE_PASSWORD="3"
FREE_SPACE="4"
FILLED_SPACE="5"
SHOW_ACTIVE_PROCESSES="6"
BACK="9"

echo "------------------------------"
echo "------COMMANDS MENU-----------"
echo "------------------------------"
echo ""

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
      passwd
    fi
    if [[ "$selectedMenu" -eq $FREE_SPACE ]]; then
      df -h
    fi
    if [[ "$selectedMenu" -eq $FILLED_SPACE ]]; then
      du -h
    fi
    if [[ "$selectedMenu" -eq $SHOW_ACTIVE_PROCESSES ]]; then
      ps -aux | more
    fi
    if [[ "$selectedMenu" -eq $BACK ]]; then
      exit
    fi

    sleep 1
    printCommandsMenu
    read selectedMenu
  done
}

executeCommandsMenu