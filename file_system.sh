#!/bin/bash

# FILE SYSTEM MENU
CREATE_DIRECTORY="1"
COPY_FILES="2"
MODIFY_PERMISSIONS="3"
SHOW_FILE_CONTENT="4"
REMOVE_FILE="5"
CHANGE_FILE_NAME="6"
DELETE_DIRECTORY="7"
BACK="9"

function printFileSystemMenu() {
  echo "1: Crear directorio"
  echo "2: Copiar archivos"
  echo "3: Modificar permisos"
  echo "4: Mostrar contenido del archivo"
  echo "5: Borrar archivo"
  echo "6: Cambiar nombre de archivo"
  echo "7: Borrar directorio"
  echo "9: Regresar"
}

function executeFileSystemMenu() {
  echo "Selecciona alguna de las siguientes opciones sobre tu sistema:"
  read selectedMenu

  while [[ ! "$selectedMenu" -eq $EXIT_MENU ]]; do
    if [[ "$selectedMenu" -eq $CREATE_DIRECTORY ]]; then
      echo "Ingresa el directorio que quieres crear: "
      read directory

      if test -d $directory; then
        echo "El directorio ya existe"
      else
        mkdir -p "$directory"
      fi
    fi
    if [[ "$selectedMenu" -eq $COPY_FILES ]]; then
      echo "Ingresa el archivo a copiar: "
      read file
      echo "Ingresa la carpeta donde se va a copiar los archivos: "
      read cpdirectory

      if test -f $file && test -d $cpdirectory; then
        cp $file $cpdirectory
      else
        echo "Ingrese un archivo y un directorio valido"
      fi
    fi
    if [[ "$selectedMenu" -eq $MODIFY_PERMISSIONS ]]; then
       bash permissions.sh
    fi
    if [[ "$selectedMenu" -eq $SHOW_FILE_CONTENT ]]; then
      echo "Ingrese el archivo a mostrar: "
      read printFile

      if test -f $printFile; then
        cat $printFile
      else
        echo "El archivo $printFile no existe"
      fi
    fi
    if [[ "$selectedMenu" -eq $REMOVE_FILE ]]; then
      echo "Ingrese el archivo a eliminar: "
      read fileToRemove

      if test -f $fileToRemove; then
        rm $fileToRemove
      else
        echo "El archivo $fileToRemove no existe"
      fi
    fi
    if [[ "$selectedMenu" -eq $CHANGE_FILE_NAME ]]; then
      echo "Ingrese el archivo a cambiar nombre: "
      read fileToChange
      echo "Ingrese el nuevo nombre: "
      read newName

      if test -f $fileToChange; then
        mv $fileToChange $newName
      else
        echo "El archivo $fileToChange no existe"
      fi
    fi
    if [[ "$selectedMenu" -eq $DELETE_DIRECTORY ]]; then
      echo "Ingrese el directorio a borrar"
      read directoryToRemove

      if test -d $directoryToRemove; then
        rm -r $directoryToRemove
      else
        echo "El directorio $directoryToRemove no existe"
      fi
    fi
    if [[ "$selectedMenu" -eq $BACK ]]; then
      exit
    fi

    sleep 1
    echo "Seleccione una opcion:"
    read selectedMenu
  done
}

printFileSystemMenu
executeFileSystemMenu