#language: es

Característica: Registro como cadete
  Regla: para registrarse un cadete debe ingresar si su vehiculo es bicicleta, moto o auto

  Escenario: Registro exitoso de cadete con comando '/registrar_cadete Pedro, moto'
    Dado que no hay un cadete con el nombre "Pedro"
    Cuando envio el mensaje '/registrar-cadete Pedro, moto'
    Entonces deberia ver un mensaje "Bienvenid@ a la flota Pedro"

  @wip
  Escenario: Intento de registro con nombre 'Juan' cuando ya hay un 'Juan' registrado falla
    Dado que hay un cadete registrado con nombre 'Juan'
    Cuando envio el mensaje '/registrar-cadete Juan, Moto'
    Entonces deberia ver un mensaje "Ya hay un usuario registrado con ese nombre"
