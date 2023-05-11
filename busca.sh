# ! /bin/bash

# Ejercicio 6

# 1er param. = nombre fichero
# Buscar dicho fichero por todo el árbol de directorios de tu cuenta.
# Si se encuentra deberá salir su ruta por pantalla

find $HOME -name $1".*" 2>$HOME/Ejercicios_Shell/errores.txt
