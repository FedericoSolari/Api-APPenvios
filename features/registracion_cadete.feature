#language: es

# @wip
Característica: Registro como cadete
Regla: para registrarse un cadete debe ingresar si su vehiculo es bicicleta, moto o auto

Escenario: Registro exitoso de cadete con comando '/registrar-cadete Pedro, moto'
Dado que no hay un cadete con el nombre Pedro
Cuando envio el mensaje '/registrar-cadete Pedro, moto'.
Entonces deberia ver un mensaje de "Bienvenid@ a la flota Pedro"