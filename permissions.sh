USER_PERMISSIONS=("0" "1" "2" "3" "4" "5" "6" "7")

function printPermissionsMenu() {
  echo "0 para dejar sin permiso"
  echo "1 para permitir ejecutar"
  echo "2 para permitir escribir"
  echo "3 para permitir ejecutar y escribir"
  echo "4 para permitir leer"
  echo "5 para permitir leer y ejecutar"
  echo "6 para permitir leer y escribir"
  echo "7 para permitir todas las acciones"
}

function main() {
  read -p "Seleccione el archivo para cambiar permisos: " selectedFile

  if test -f $selectedFile; then
    echo ""
  else
    echo "El archivo no existe"
    exit 0
  fi

  printPermissionsMenu

  read -p "Ingrese permiso para el usuario: " selectedPermission

  while [[ ! " ${USER_PERMISSIONS[@]} " =~ " ${selectedPermission} " ]]; do
    read -p "Permiso invalido, ingrese permiso para el usuario: " selectedPermission
  done

  read -p "Ingrese permiso para el grupo: " selectedGroupPermission
  while [[ ! " ${USER_PERMISSIONS[@]} " =~ " ${selectedGroupPermission} " ]]; do
    read -p "Permiso invalido, ingrese permiso para el grupo: " selectedGroupPermission
  done

  read -p "Ingrese permiso para otros: " selectedOtherPermission
  while [[ ! " ${USER_PERMISSIONS[@]} " =~ " ${selectedOtherPermission} " ]]; do
    echo 
    read -p "Permiso invalido, ingrese permiso para otros: " selectedOtherPermission
  done

  chmod $selectedPermission$selectedGroupPermission$selectedOtherPermission $selectedFile
}

main