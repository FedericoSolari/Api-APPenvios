#language: es
Característica: Notificar entrega de envio

Antecedentes:

    Dado que estoy registrado como cliente
    Y que hay registrado un cadete
    Y hay un envio con direccion "Cerrito 628", "CP: 1049"
    Y con estado "en camino"

Escenario: Cuando se entrega mi envio recibo notificación de entrega

    Cuando confirmo entrega con "/confirmar-entrega ID"
    Entonces deberia ver un mensaje para el cliente "Ya entregamos tu envio (ID:"
