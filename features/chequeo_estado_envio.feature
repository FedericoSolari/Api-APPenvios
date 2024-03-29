#language: es

Característica: Como cliente quiero ver el estado del envio
  Antecedentes:
    Dado que estoy registrado como cliente
    Y hay un envio con direccion "Cerrito 628", "CP: 1049"

  Escenario: Obtener el estado de un envio sin cadete asignado
    Dado que el envio esta "pendiente de asignacion"
    Cuando mando el mensaje "/estado-envio ID"
    Entonces deberia ver un mensaje que incluya "se encuentra pendiente de asignación"
    Y deberia ver el id del envio

  Escenario: Obtener el estado de un envio que ya fue asignado a un cadete
    Dado que hay registrado un cadete
    Y que el envio esta "asignado"
    Cuando mando el mensaje "/estado-envio ID"
    Entonces deberia ver un mensaje que incluya "fue asignado a juan, ya está en camino!"
    Y deberia ver el id del envio

  Escenario: Obtener el estado de un envio que ya fue retirado por un cadete
    Dado que hay registrado un cadete
    Y que el envio esta "en camino"
    Cuando mando el mensaje "/estado-envio ID"
    Entonces deberia ver un mensaje que incluya "se encuentra en camino al domicilio"
    Y deberia ver el id del envio
    Y deberia ver un mensaje que incluya "Tiempo estimado:"

  Escenario: Obtener el estado de un envio entregado
    Dado que hay registrado un cadete
    Y que el envio esta "entregado"
    Cuando mando el mensaje "/estado-envio ID"
    Entonces deberia ver un mensaje que incluya "Ya entregamos tu envio"
    Y deberia ver el id del envio
