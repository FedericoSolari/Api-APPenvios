#language: es
@wip
Característica: Notificar entrega de envio

Antecedentes:

Dado que existe un envio con direccion "Cerrito 628, CP: 1049"
Y esta en proceso de entrega

Escenario: Cuando se entrega mi envio recibo notificación de entrega

Cuando se entrega mi envio
Entonces deberia ver el mensaje que incluya "Ya entregamos tu envío (ID:"
