#language: es
@wip
Característica: Como cliente quiero ver un informe de mis envios realizados

Antecedentes:
    Dado que estoy registrado como cliente
    Y hay un envio con direccion "Cerrito 628", "CP: 1049"
    Y hay un envio con direccion "Av Las Heras 1250", "CP: 1018"
    Y hay un envio con direccion "Cerrito 620", "CP: 1049"
    Y hay un envio con direccion "Av Las Heras 1244", "CP: 1018"
    Y hay un envio con direccion "Cerrito 628", "CP: 1049"


Escenario: Al mandar comando '/historial' se muestra resumen de ultimos 5 envios realizados por el cliente
    Cuando envio el mensaje '/historial'
    Entonces debería ver un mensaje que incluya 'Aquí tienes un resumen de tus últimos pedidos:'
    Y debería ver un mensaje que incluya 'Envio: ID'
    Y debería ver un mensaje que incluya 'Tamaño: '
    Y debería ver un mensaje que incluya 'Dirección destino: '
    Y debería ver un mensaje que incluya 'Cadete asignado: '
    Y debería ver un mensaje que incluya 'Estado: '