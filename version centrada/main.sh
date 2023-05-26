#!/bin/bash
. ./nube.sh
. ./lore.sh

#variables
Cantidad_digitos=6 #Cantidad de digitos que tendra la puerta
Vidas=10 #Intentos

ejecturar_videojuego(){

    Victoria=false
    digito=1
    clear
        echo '                                                 ----------------------------------'
        echo "                                                         CONFIGURACION ELEGIDA       "
        echo '                                                 ----------------------------------'
        echo "                                                 Vidas: $Vidas"
        echo "                                                 Cantidad de digitos: $Cantidad_digitos"
    sleep 1
    lore
    num_aleatorio=$(shuf -i 0-9 -n 1)
    while [ "$digito" -le "$Cantidad_digitos" ] && [ "$Vidas" -ne 0 ];do
        clear
        #echo $num_aleatorio
        echo "                                                 Insertar numero para desbloquear"
        read -p "                                                 " Try_Num
        if [ "$Try_Num" -eq "$num_aleatorio" ];then
            diferencia_digitos=$((Cantidad_digitos-digito))
            digito=$((digito+1))
            num_aleatorio=$(shuf -i 0-9 -n 1)
            clear
        echo "                                                 Chiclin suena desde la maquina has acertado el numero,"
        echo "                                                 Te fijas y solo te quedan $diferencia_digitos numeros, ya queda menos para sacarla"
            #echo $digito
            read -p "                                                 Pulsa Enter para continuar......   " la

        elif [ "$Try_Num" -ne "$num_aleatorio" ];then
            Vidas=$((Vidas-1))
            clear
            
        echo "                                                 MEEEC, se escucha desde la maquina,"
        echo " "
            if [ "$Try_Num" -gt "$num_aleatorio" ];then
        echo "                                                 El numero es mas pequeño."
                sleep 0.5
            
            elif [ "$Try_Num" -lt "$num_aleatorio" ];then
        echo "                                                 El numero es mas grande."
                sleep 0.5
            fi

        echo ""
        echo "                                                 Te quedan $Vidas vidas"
        read -p "                                                 Pulsa Enter para continuar......   " la 
            
        fi

    done

    if [ "$digito" -gt "$Cantidad_digitos" ];then
        clear
        echo "                                                 CRACK!, se desbloquea la puerta y tu hija sale sana y salva,"
        echo "                                                 se acerca lentamente a ti y cuanto mas se acerca"
        echo "                                                 te vas dando cuenta que no es ella SI NO UN ENANO TRANSVESTIDO,"
        echo "                                                 que te dice que tu hija esta en el siguiente castillo"
        echo " "
        read -p "                                                 Pulsa Enter para continuar.....   " la 
        clear
    fi
    if [ "$Vidas" -eq 0 ];then
        clear
        echo "                                                 BOOM!!!!!!!"
        echo "                                                 El aparato explota mientras se va llenano la habitacion de agua"
        echo "                                                 ves a tu hija ahogandose en terrible sufrimiento y derrepente..."
        echo "                                                 implosiona por algun motivo inentendible, enhorabuena eres mal padre"
        echo "                                                 y no sabes adivinar numeros, sin mujer y sin hija te quedas."
        read -p "                                                 Pulsa Enter para continuar.....   " la 
        clear
    fi

    digito=1
    Vidas=10
}


execute_menu_configuracion(){
    bucle_configuracion=true
    error=false

    while [ "$bucle_configuracion" = true ];do
        clear
        echo '                                                 ----------------------------------'
        echo '                                                            CONFIGURACION           '
        echo '                                                 ----------------------------------'
        echo '                                                 1. Cambiar tamaño del codigo de la puerta.'
        echo '                                                 Valor por defecto = 6'
        echo " "
        sleep 0.7
        echo '                                                 2. Dificultad del juego.'
        echo '                                                 Valor por defecto = Abandonador'
        echo " "
        sleep 0.7
        echo '                                                 3. Volver al menu principal'
        sleep 0.7
        echo '                                                 ----------------------------------'
        echo '                                                 Elige una opcion:'
        read -p "                                                 " eleccion_config
        


        if [ "$eleccion_config" -eq 1 ];then
            clear
            while [ "$error" = false ] ;do
        echo '                                                 ----------------------------------'
        echo '                                                 Inserte nuevo valor para Cantidad de digitos: '
        echo '                                                 (Valor minimo [3])'               
                read -p "                                                 " Cantidad_digitos 
                error=true
                if [ "$Cantidad_digitos" -lt 3 ];then
        echo '                                                 ----------------------------------'
        echo '                                                 La dificultad no puede ser menor a 3'
        echo '                                                 ----------------------------------'
                    error=false
                fi
            done               
            eleccion_config=0

        elif [ "$eleccion_config" -eq 2 ];then
            #Dificultad del juego = Cantidad de vidas
            bucle_dificultad=true
            
            
            while [ "$bucle_dificultad" = true ];do
                clear
        echo '                                                 Elige un nuevo nivel de dificultad'
        echo '                                                 ----------------------------------'
        echo '                                                 1. Abandonador -10 Vidas-'
                sleep 0.7
        echo '                                                 2. Padre -7 Vidas-'
                sleep 0.7
        echo '                                                 3. Giga-chad -5 Vidas-'
                sleep 0.7
        echo '                                                 4. Anair -2 Vidas-'
                sleep 0.7
        echo '                                                 5. Volver a opciones'
        echo '                                                 ----------------------------------'
        echo '                                                 Elige una opcion:'
                read -p "                                                 " eleccion_dificultad                
                if [ "$eleccion_dificultad" -eq 1 ]; then
                    Vidas=10
                    bucle_dificultad=false
                elif [ "$eleccion_dificultad" -eq 2 ]; then
                    Vidas=7
                    bucle_dificultad=false
                elif [ "$eleccion_dificultad" -eq 3 ]; then
                    Vidas=5
                    bucle_dificultad=false
                elif [ "$eleccion_dificultad" -eq 4 ]; then
                    Vidas=2
                    bucle_dificultad=false
                elif [ "$eleccion_dificultad" -eq 5 ]; then
                    bucle_dificultad=false
                else
        echo '                                                 ----------------------------------'
        echo '                                                  Parametro fuera de los limites'
        echo '                                                 ----------------------------------'
                fi
            done

            eleccion_config=0
            eleccion_dificultad=0

        elif [ "$eleccion_config" -eq 3 ];then
        echo "                                                 Volviendo al menu principal...."
            sleep 0.7
            clear
            bucle_configuracion=false
            eleccion_config=0
            eleccion_dificultad=0
        
        else
        echo '                                                  ----------------------------------'
        echo '                                                  Parametro fuera de los limites'
        echo '                                                  ----------------------------------'
        fi
    done
}


show_menu_principal(){
    nubes
    buclemain=false
    while [ "$buclemain"=false ];do
        clear
        echo '                                                             -[{SAVIOR}]-           '
        echo '                                                 1: Iniciar partida'
        sleep 0.7
        echo '                                                 2: Configuracion de la partida'
        sleep 0.7
        echo '                                                 3: SALIR'
        sleep 0.7
        echo '                                                 ----------------------------------'
        echo '                                                 ¿Que quieres hacer?'
        read -p "                                                 " eleccion_menu_principal 

        if [ "$eleccion_menu_principal" -eq 1 ]; then
            ejecturar_videojuego
        elif [ "$eleccion_menu_principal" -eq 2 ]; then
            execute_menu_configuracion
        elif [ "$eleccion_menu_principal" -eq 3 ]; then
        echo '                                                 Saliendo de Savior.....'
            sleep 0.4
            clear
            exit
        else 
        echo '                                                 ----------------------------------'
        echo '                                                 Parametro fuera de los limites'
        echo '                                                 ----------------------------------'
        fi

    done
}


show_menu_principal