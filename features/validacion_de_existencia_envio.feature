#language: es

Característica: Validacion de existencia de ID de envio

Escenario: Cuando no existe el envio en la consulta del estado
  Dado que estoy registrado como cliente
  Cuando mando el mensaje "/estado-envio ID" con ID de envio inexistente
  Entonces deberia ver un mensaje que incluya "No se encontró un envio con ID"

Escenario: Cuando no existe el envio en la confirmacion de la entrega
  Dado que estoy registrado como cadete
  Cuando mando el mensaje "/confirmar-entrega ID" con ID de envio inexistente
  Entonces deberia ver un mensaje que incluya "No se encontró un envio con ID"
