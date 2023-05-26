#!/bin/bash
#variables
Cantidad_digitos=6
Vidas=10
Min_number=0
Max_number=9


execute_menu_configuracion(){
    bucle_configuracion=true

    while [ "$bucle_configuracion" = true ];do
        clear
        echo '1. Cambiar tamaño del codigo de la puerta (Por defecto es 6)'
        echo '2. Dificultad del juego (Numero de vidas).'
        echo '3. Volver atras'
        read -p 'Elige una opcion: ' eleccion_config


        if [ "$eleccion_config" -eq 1 ];then
            echo 'Inserte nuevo valor para Cantidad de digitos: '
            read Cantidad_digitos 
            eleccion_config=0

        elif [ "$eleccion_config" -eq 2 ];then
            bucle_dificultad=true
            
            
            while [ "$bucle_dificultad" = true ];do
                clear
                echo '1. Abandonador: 10 Vidas'
                echo '2. Padre: 7 Vidas'
                echo '3. Giga-chad: 5 Vidas'
                echo '4. Anair: 2 Vidas'
                echo '5. Volver al menu principal'
                read -p 'Elige una opcion: ' eleccion_dificultad
                
                if [ "$eleccion_dificultad" -eq 1 ]; then
                    Vidas=10
                elif [ "$eleccion_dificultad" -eq 2 ]; then
                    Vidas=7
                elif [ "$eleccion_dificultad" -eq 3 ]; then
                    Vidas=5
                elif [ "$eleccion_dificultad" -eq 4 ]; then
                    Vidas=2
                elif [ "$eleccion_dificultad" -eq 5 ]; then
                    bucle_dificultad=false
                else
                    echo 'Dificultad fuera de los parámetros'
                fi
            done

            eleccion_config=0
            eleccion_dificultad=0

        elif [ "$eleccion_config" -eq 3 ];then
            echo "salir"
            bucle_configuracion=false
            eleccion_config=0
            eleccion_dificultad=0
        
        else
            echo 'Valor no dentro de los parametros'
        fi
    done
}

execute_menu_configuracion