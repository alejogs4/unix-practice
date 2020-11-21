#!/bin/bash

# USERS MENU
CONNECTED_USERS="1"
CONNECTED_USERS_NUMBER="2"
IS_CONNECTED_USER="3"
SEND_MESSAGE="4"
BACK="9"

EMPTY_USER=""

function printUsersMenu() {
  echo "1: Mostrar usuarios conectados"
  echo "2: Mostrar cuantos usuarios estan conectados"
  echo "3: Mostrar si un usuario esta conectado"
  echo "4: Enviar mensaje a un usuario"
  echo "9: Regresar"
}

function executeUsersMenu() {
  echo "Selecciona alguna de las siguientes opciones:"
  read selectedMenu

  while [[ ! "$selectedMenu" -eq $BACK ]]; do
    if [[ "$selectedMenu" -eq $CONNECTED_USERS ]]; then
      echo "Los usuarios conectados es: "
      who -us
    fi
    if [[ "$selectedMenu" -eq $CONNECTED_USERS_NUMBER ]]; then
      echo "El numero de usuarios conectados es: "
      who -q
    fi
    if [[ "$selectedMenu" -eq $IS_CONNECTED_USER ]]; then
       echo "Ingrese el nombre del usuario que quiere encontrar: "
       read connectedUser
       user=$(who|grep $connectedUser)
       echo "$user"     
    fi
    if [[ "$selectedMenu" -eq $SEND_MESSAGE ]]; then
       who
       read -p "Ingrese el nombre del usuario que quiere enviarle el mensaje: " $userMessage
       write $userMessage     
    fi

    sleep 1
    echo "Seleccione una opcion:"
    read selectedMenu
  done
}

printUsersMenu
executeUsersMenu