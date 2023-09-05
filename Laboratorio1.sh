#!/bin/bash

function get_permissions_verbose {

	#Separa los permisos del archivo usando congruencias mod10
	user="$(("$1"%10))"
	temp="$(("$(("$1"-"$user"))"/10))"
	group="$(("$temp" % 10 ))"
	temp="$(("$(("$temp"-$group))"/10))"
	other="$(("$temp"%10))"
	permisos=("user" "group" "other")

	for i in "${permisos[@]}" #Estructura de control, menciona cuales permisos tiene cada usuario
	do
		echo "El usuario $i tiene permisos para: "
		case ${!i} in
			0)
				echo "No tiene permisos"
				;;
			1)
				echo "Ejecutar"
				;;
			2)	
				echo "Escribir"
				;;
			3)
				echo "Escribir y Ejecutar"
				;;
			4)
				echo "Leer"
				;;
			5)
				echo "Leer y Ejecutar"
				;;
			6)
				echo "Leer y Escribir"
				;;
			7)
				echo "Leer, Escribir y Ejecutar"
				;;
		esac
	done
}

if [ $# -ne 1 ]; then
	echo "Debe introducir solo un paramentro"
	exit 1 
fi
if [ -e "$1" ]; then
	#Obtiene los permisos del archivo
	perm="$(stat -c%a $1)" 
else
	echo "El archivo no exsite"
	exit 1
fi

get_permissions_verbose $perm


