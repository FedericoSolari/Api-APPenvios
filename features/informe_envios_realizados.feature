#language: es

@wip
Característica: Como cliente quiero ver un informe de mis envios realizados

Antecedentes:
    Dado que estoy registrado como cliente
    Y que realice 5 envios

Escenario: Al mandar comando '/historial' se muestra resumen de ultimos 5 envios realizados por el cliente
    Cuando envio el mensaje '/historial'
    Entonces debería ver un mensaje que incluya 'Aquí tienes un resumen de tus últimos pedidos:'
    Y debería ver un mensaje que incluya 'Envio: ID'
    Y debería ver un mensaje que incluya 'Tamaño: '
    Y debería ver un mensaje que incluya 'Dirección destino: '
    Y debería ver un mensaje que incluya 'Cadete asignado: '
    Y debería ver un mensaje que incluya 'Estado: '