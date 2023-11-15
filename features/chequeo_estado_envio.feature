#language: es

# @wip
Característica: Como cliente quiero ver el estado del envio
Antecedentes:
Dado Que estoy registrado como cliente
Y existe el envio con el ID 1
Y con direccion "Santa fe 1223", "CP: 1400"

Escenario: Obtener el estado de un envio sin cadete asignado
Dado que el envio con ID 1 esta sin asignar
Cuando Mando el comando "/estado_envio" "1"
Entonces deberia el mensaje "Tu envio (ID: 1) se encuentra pendiente de asignación"

Escenario: Obtener el estado de un envio que ya fue asignado a un cadete
Dado que el envio con ID 1 esta entregado
Cuando Mando el comando "/estado_envio" "1"
Entonces deberia el mensaje "Tu envio (ID: 1) se encuentra en proceso de entrega"
