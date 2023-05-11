#!/bin/bash
<< 'MULTILINE-COMMENT'
1. Crea un script que ejecute las siguientes tareas:
Visualice una cadena en la pantalla en la que aparezca el autor del shell script.
Muestre el directorio actual.
Muestre la fecha y la hora del sistema.
Muestre los usuarios conectados actualmente a la máquina.
Usa comentarios dentro del fichero creado, explicando antes de cada orden su utilidad. 

# autor del shell
echo $LOGNAME
# directorio actual
pwd
# fecha actual
date
# usuarios conectados
w
MULTILINE-COMMENT

#2. Ejecuta el script anterior y almacena su salida en un fichero que se llame salida1.txt 
# (utiliza redireccionamiento de comandos). 
<< 'MULTILINE-COMMENT'
echo '# autor del shell' >> salida1.txt
echo $LOGNAME >> salida1.txt
echo '# directorio actual' >> salida1.txt
pwd >> salida1.txt 
echo '# fecha actual' >> salida1.txt
date >> salida1.txt
echo '# usuarios conectados' >> salida1.txt
w >> salida1.txt
MULTILINE-COMMENT

# 3  Realiza un script que realice una copia del fichero anterior cuyo nombre sea salida2.txt 
# pero además añade al final el contenido ordenado, alfabéticamente por la primera columna (sort), del fichero salida1.txt al fichero salida2.txt. 
<< 'MULTILINE-COMMENT'
cp salida1.txt salida2.txt 
sort salida1.txt >> salida2.txt
MULTILINE-COMMENT

# 4. Realizar un script que reciba como primer parámetro el camino completo de un directorio al que se realizará una copia del fichero salida1.txt. 
# La macro deberá ejecutarse desde tu directorio HOME.
<< 'MULTILINE-COMMENT'
if [ $# -eq 1 ] && [ -e /home/$(whoami)/$1 ] && [ ! -d /home/$(whoami)/$1 ]
then
cp /home/$(whoami)/$1 /home/$(whoami)/Documentos/sistemas/salida1.txt 
else
echo "solo puede pasar una ruta desde home, debe ser un fichero y debe existir"
fi
MULTILINE-COMMENT

# 5. Realizar un script que reciba como primer parámetro el nombre de un directorio 
# y como segundo parámetro el nombre de un fichero. La macro deberá realizar una copia del fichero salida1.txt 
# del directorio HOME al directorio pasado como primer parámetro y con el nombre indicado por el segundo parámetro. 
<< 'MULTILINE-COMMENT'
if [ $# -eq 2 ] && [ -d /home/$(whoami)/$1 ]
then
cp /home/$(whoami)/Documentos/sistemas/salida1.txt  /home/$(whoami)/$1/$2
else
echo '/home/$(whoami)/$1' 
echo "solo puede pasar una ruta desde home, debe ser un directorio"
fi
MULTILINE-COMMENT

# 6. Realizar un script que pida al usuario por teclado el nombre de un fichero para posteriormente 
# realizar una búsqueda de dicho fichero por todo el árbol de directorios de tu cuenta. 
# Si se encuentra alguna copia del fichero deberá salir su camino en la pantalla. La macro deberá llamarse busca.
<< 'MULTILINE-COMMENT' 
echo "$1"
find ~ -name "$1"
MULTILINE-COMMENT

# 7. Script que solicite la entrada desde el teclado del nombre de usuario del cual buscar sus procesos 
# e indique el número de dichos procesos que actualmente se están ejecutando en la máquina.
echo "usuario"
read usuario
ps -u $usuario