#language: es

Característica: Como cadete quiero actualizar el estado del envio
  Antecedentes:
    Dado que estoy registrado como cadete
    Y que hay registrado un cliente con domicilio "Av Las Heras 1232", "CP: 1018"
    Y hay un envio con direccion "Cerrito 628", "CP: 1049"
    Y estoy asignado al envio
    Y con estado "en proceso"

  Escenario: Se marca como entregado el envio
    Cuando confirmo entrega con "/confirmar-entrega ID"
    Entonces deberia ver un mensaje "Gracias por entregar el envio!"
