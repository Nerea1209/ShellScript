# ! /bin/bash

# Ejercicio 5

# Recibe como 1er parámetro el nombre de un directorio
# Recibe como 2o parámetro el nombre de un fichero
# La macro realiza una copia de salida1.txt de HOME al directorio del 1er param.
# con el nombre del 2o param.

cp $HOME/Ejercicios_Shell/salida1.txt $1/$2.txt
