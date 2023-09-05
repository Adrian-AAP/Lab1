#!/bin/bash

#Primera entrada: Nombre del usuario y contrasena
#Segunda enrtada: Nombre del grupo

#Revisa si usuario con nombre dado existe, si no, lo crea
if [ $# -ne 2 ]; then
	echo "Debe introducir dos parametros"
	exit 1
fi

if  id -u "$1" &>/dev/null; then
	echo "Ya existe un usuario con este nombre"
else
	sudo useradd -m -p $1 $1
fi


#Revisa si grupo con nombre dado existe, si no, lo crea
if [ $(getent group $2) ]; then
	echo "Ya existe un grupo con este nombre"
else
	#sudo groupadd $2
	echo "A"
fi

sudo usermod -aG $2 vmub 		#Asignar usuario default al grupo
sudo usermod -aG $2 $1 			#Asignar usuario $1 al grupo

sudo chgrp $2 Laboratorio1.sh

sudo chmod ugo-x Laboratorio1.sh 	#Quita permisos a todos
sudo chmod g+x Laboratorio1.sh		#Da permisos al grupo
