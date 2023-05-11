# ! /bin/bash

# Ejercicio 7

# Solicita el nombre por teclado
# para buscar sus procesos y el núm. de procesos que se están ejecutando
read -p '¿Cuál es su nombre?	' nombre

ps -u $nombre | wc -l
