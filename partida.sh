Cantidad_digitos=6
Vidas=10

Victoria=false

digito=1
num_aleatorio=$(shuf -i 0-9 -n 1)
while [ "$digito" -le "$Cantidad_digitos" ] && [ "$Vidas" -ne 0 ];do
    echo "Insertar numero para desbloquear"
    read Try_Num
    if [ "$Try_Num" -eq "$num_aleatorio" ];then
        digito=$((digito+1))
        num_aleatorio=$(shuf -i 0-9 -n 1)
        echo "Chiclin suena desde la maquina has acertado el numero, ya queda menos para sacarla"

    elif [ "$Try_Num" -ne "$num_aleatorio" ];then
        Vidas=$((Vidas-1))
        echo "MEEEC, se escucha desde la maquina."
        echo "Numero equivocado 1 oportunidad menos para salvar a tu hija"
        echo $Vidas
    fi

done

if [ "$digito" -gt "$Cantidad_digitos" ];then
    echo "Has ganado"
fi
if [ "$Vidas" -eq 0 ];then
    echo "Has perdido"
fi
