#language: es

Característica: Como cadete quiero actualizar el estado del envio
  Antecedentes:
    Dado que estoy registrado como cadete
    Y que hay registrado un cliente con domicilio "Av Las Heras 1232", "CP: 1425"
    Y hay un envio con direccion "Santa fe 1223", "CP: 1400"
    Y estoy asignado al envio
    Y con estado "en proceso"

  Escenario: Se marca como entregado el envio
    Cuando confirmo entrega con "/confirmar-entrega ID"
    Entonces deberia ver un mensaje "Gracias por entregar el envio!"
