#language: es

@wip
Característica: Como cadete quiero actualizar el estado del envio
  Antecedentes:
    Dado que estoy registrado como cadete
    Y estoy asignado a un envio
    Y con estado "Proceso de entrega"

  Escenario: Se marca como entregado el envio
    Cuando envio el comando "/confirmar-entrega ID"
    Entonces deberia ver "Gracias por entregar el envio"
