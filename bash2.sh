#!/bin/bash

# ejercicio 1
# Programa que visualice un mensaje de error si no se le pasan parámetros, 
# y que los visualice si se le pasan

# if [ $# -eq 0 ]
# then 
# echo "Necesito Parametros"
# fi

# ejercicio 2
# Programa que reciba tres números y diga cuál es el mayor

#   for (( i ; i<$# ; i++ ))
#   do
#   echo $i 
#   done
    
 
# 3 Programa que reciba dos números como parámetro y devuelva la suma si el primero es mayor que el segundo, 
# la resta si el primero es menor y la multiplicación en caso contrario.

#if [ $# -eq 2 ]
#then 
#    if [ $1 -gt $2 ]
#    then
#        echo $(( $1 + $2))
#    elif [ $1 -lt $2 ]
#    then 
#        echo $(( $1 - $2 ))
#    else
#        echo $(( $1 * $2 ))
#    fi 
#else
#echo "Necesito 2 parametros"
#fi

# 4 Programa que reciba tres números y diga cuál es el mayor

#if [ $# -eq 3 ]
#then 
#    if [ $1 -gt $2 ] && [ $1 -gt $3 ]
#    then
#        echo  $1
#    elif [ $2 -gt $3 ] && [ $2 -gt $1 ]
#    then 
#        echo $2
#    else
#        echo $3
#    fi 
#else
#echo "Necesito 3 parametros"
#fi

# 5 Programa llamado existe al que se le pasa como parámetro un fichero y dice si existe, 
# no existe o es un directorio.
<< 'MULTILINE-COMMENT'
if [ $# -eq 1 ]
then
    if [ -e $1 ]
        then
        if [ -d $1 ]
        then
        echo "existe y es un directorio"
        else
        echo "existe pero no es un directorio"
        fi
    else
        echo "no existe"
    fi
else
echo "Necesito un parametro"
fi
MULTILINE-COMMENT
# 6 Realiza un shell-script, que pida dos números por teclado. El programa pintará tantos *, 
# como indique el número mayor de los dos introducidos.
<< 'MULTILINE-COMMENT'
echo "Dame el primer numero"
read  variable1
read  -p "Dame el segundo valor" variable2


    if [ $variable1 -gt $variable2 ]
    then
        for (( i=$variable1; i>0; i-- ))
        do
            echo "*"
        done 
    else
        for (( i=$variable2; i>0; i-- ))
        do
            echo "*"
        done 
    fi
MULTILINE-COMMENT
# 7 Shell-script que muestre todos los números pares, 
# desde el 0 hasta el 100 (prueba a hacerlo con y sin una lista de valores).
<< 'MULTILINE-COMMENT'
for (( i=0; i<101; i++ )) 
do
    if [ $(($i%2)) -eq 0  ]
    then echo $i
    fi
done


for (( i=0; i<101; i-- )) 
do
    if [ $(($i%2)) -eq 0  ]
    then echo $i
    fi
done



for i in $(seq 1 100)
do
    if [ $(($i%2)) -eq 0  ]
    then echo $i
    fi
done
MULTILINE-COMMENT

# 8 Realiza un shell-script, que calcule la potencia de un número. 
# El shell pedirá la base y el exponente, devolviendo la potencia.
<< 'MULTILINE-COMMENT'
echo "Dame la base"
read base
echo "Dame el exponente"
read exponente
var=1;
for (( i=$exponente;i>0;i-- ))
do
    var=$(( $base*$var ))
    
done
echo $var
MULTILINE-COMMENT

#9 Implementa un shell-scipt que indique si los ficheros pasados por parámetro 
#(numero de ficheros no especificado) existen y si son ficheros o directorios.
<< 'MULTILINE-COMMENT'
for parametro in $*
do
    if [ -e $parametro ]
    then
        if [ -d $parametro ]
        then echo 'El fichero existe y es un directorio'
        else echo 'El fichero existe y es un fichero'
        fi
    else echo 'El fichero no existe'
    fi
done
MULTILINE-COMMENT

# 10 Implementar un shell-script que copie todos los ficheros que se le pasen por parámetro, 
# al directorio Seguridad. Si directorio no existe, se deberá crear.
<< 'MULTILINE-COMMENT'
for parametro in $*
do
    if [ -e seguridad ] && [ -d seguridad ]
    then
    cp $parametro seguridad
    else
    mkdir seguridad
    cp $parametro seguridad
    fi

done
MULTILINE-COMMENT

# 11 Realiza un shell-script que muestre el nombre de cada uno de los ficheros pasados por parámetro y 
# visualice su contenido por pantalla (usa algún separador entre ficheros, como una línea de asteriscos.
<< 'MULTILINE-COMMENT'
for parametro in $*
do
    echo $parametro
    cat $parametro
    echo '*********'
done
MULTILINE-COMMENT

# 12 Implementa un shell-script, que permita intercambiar el nombre de 2 ficheros pasados por parámetro. 
<< 'MULTILINE-COMMENT'
nombre1=$1
nombre2=$2

mv $1 tmp1.txt
mv $2 tmp2.txt
mv tmp1.txt $nombre2
mv tmp2.txt $nombre1
MULTILINE-COMMENT

# 13 Realiza un shell-script que limpie la pantalla, 
#muestre todos los nombres de ficheros que hay en el directorio actual (mostrando sus atributos), 
#la fecha actual y tu login.
<< 'MULTILINE-COMMENT'
clear 
ls -l ./
MULTILINE-COMMENT

# 14 Realiza un shell-script que permita recibir, al menos, dos parámetros. 
# El primero serán opciones, y el segundo un fichero. 
# Si el primer parámetro es -e, el shell ejecutará el programa que se pasa como segundo parámetro, 
# si el primer parámetro es -m, el shell mostrará el contenido del fichero pasado como segundo parámetro.
<< 'MULTILINE-COMMENT'
if [ $# -lt 2 ]
then echo "necesito mínimo dos parametros"
else 
    case $1 in
    '-e' )
    $2;;
    '-m' )
    cat $2;;
    esac
fi
MULTILINE-COMMENT
# 15 Implementa un shell-script que compruebe si los ficheros pasados por parámetro existen. 
# Si existen, se muestran los permisos del fichero, si no existen, se muestra un mensaje de error.
<< 'MULTILINE-COMMENT'
for parametro in $*
do
    if [ -e $parametro ]
    then ls -l $parametro
    else echo 'El archivo no existe'
    fi

done
MULTILINE-COMMENT
# 16 Realizar un programa que recibe 2 parámetros, se mostrará un menú de opciones y 
# dependiendo de la opción especificada (dentro del programa por teclado, no por parámetro) 
# hace  una operación u otra con los parámetros. Por ejemplo, si se escribe +, sum o sumar, 
# el programa suma. Si se escribe exit o salir, el programa termina. Si la opción no es válida lo indicará.
<< 'MULTILINE-COMMENT'
if [ $# -eq 2 ]
then
    while [ 1 -eq 1 ]
    do
    echo 'opciones: sumar, restar, salir'
    read opcion
    case $opcion in
        '+'|'sum'|'sumar')
        echo $(($1+$2))
        ;;
        '-'|'restar'|'rest')
        echo $(( $1-$2 ))
        ;;
        'salir'|'exit')
        break
        ;;
        *)
        echo 'opcion no valida'
    esac
    done
else
echo 'Se necesitan 2 parametros'
fi
MULTILINE-COMMENT

# 17 Repetir el ejercicio anterior usando una función diferente cada opción. 
# Se mostrará un mensaje de ayuda (función ayuda) en caso de que la opción no sea correcta. 
# Ej: "Opción no válida. Introduzca alguna de las siguientes..."
<< 'MULTILINE-COMMENT'
sumar(){
    local resultado=$(($1+$2))
    echo $resultado
}

restar(){
    local resultado=$(($1-$2))
    echo $resultado
}

ayuda(){
    echo 'opciones disponibles: (+|sum|sumar)|( -|rest|restar)|(salir|exit)'
}

if [ $# -eq 2 ]
then
    while [ 1 -eq 1 ]
    do
    echo 'opciones: sumar, restar, salir'
    read opcion
    case $opcion in
        '+'|'sum'|'sumar')
        echo $(sumar $1 $2)
        ;;
        '-'|'restar'|'rest')
        echo $(restar $1 $2)
        ;;
        'salir'|'exit')
        break
        ;;
        *)
        ayuda
    esac
    done
else
echo 'Se necesitan 2 parametros'
fi
MULTILINE-COMMENT