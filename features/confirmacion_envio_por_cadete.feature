#language: es

Característica: Como cadete quiero actualizar el estado del envio
  Antecedentes:
    Dado que estoy registrado como cadete
    Y que hay registrado un cliente con domicilio "Av Las Heras 1232", "CP: 1018"
    Y hay un envio con direccion "Cerrito 628", "CP: 1049"
    Y estoy asignado al envio
    Y con estado "asignado"

  Escenario: Se marca como entregado el envio
    Cuando confirmo entrega con "/confirmar-entrega ID"
    Entonces deberia ver un mensaje "Gracias por entregar el envio!"

  @wip
  Escenario: Como cadete confirmo retiro del envio del domicilio de origen
    Dado que el estado del envio se encuentra 'en proceso'
    Y estoy asignado al envio
    Cuando confirmo retiro con "/confirmar-retiro ID"
    Entonces deberia ver un mensaje "Gracias por retirar el envío!"
