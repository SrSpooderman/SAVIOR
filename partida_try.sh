Cantidad_digitos=6
Vidas=10
Victoria=false

for ((i=0; i<=$Cantidad_digitos; i++));do
    num_aleatorio=$(shuf -i 0-9 -n 1)
    while_game=true
    while [ "$while_game" = true ];do
        echo "Insertar numero para desbloquear"
        read Try_Num
        if [ "$num_aleatorio" -eq "$Try_Num" ];then
            echo "La clavija suena"
        elif []
done
if [ "$Victoria" = true ];then
    echo "Has ganado"
if [ "$Vidas" -eq 0 ];then
    echo "Tu hija se ha muerto"