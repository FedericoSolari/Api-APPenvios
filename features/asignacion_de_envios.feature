#language: es

Característica: Como cadete quiero solicitar ser asignado a un envio
  Antecedentes:
    Dado que hay registrado un cliente con domicilio "Av Las Heras 1232", "CP: 1425"
    Y que estoy registrado como cadete
    Y hay un envio con direccion "Av Las Heras 3361", "CP: 1425"

  Escenario: Asignación básica de cadete
    Cuando envio el comando "/asignar-envio"
    Entonces se me asigna un envio
    Y deberia ver el id del envio
    Y deberia ver un mensaje que incluya "Av Las Heras 1232, CP: 1425"
    Y deberia ver un mensaje que incluya "Av Las Heras 3361, CP: 1425"
