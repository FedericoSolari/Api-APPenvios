#language: es
Característica: Validar vehiculo en la creacion de un cadete

Antecedentes:
Dado que no hay un cadete con el nombre "Pedro"
Dado que no hay un cadete con el nombre "Ulises"
Dado que no hay un cadete con el nombre "Amancio"
Dado que no hay un cadete con el nombre "Donald"

Escenario: cadete registrado con exito con comando '/registrar-cadete Pedro, bicicleta'
Cuando envio el mensaje '/registrar-cadete Pedro, bicicleta'
Entonces  deberia ver un mensaje "Bienvenid@ a la flota Pedro"

Escenario: cadete registrado con exito con comando '/registrar-cadete Ulises, moto'
Cuando envio el mensaje '/registrar-cadete Ulises, moto'
Entonces  deberia ver un mensaje "Bienvenid@ a la flota Ulises"

Escenario: cadete registrado con exito con comando '/registrar-cadete Amancio, auto'
Cuando envio el mensaje '/registrar-cadete Amancio, auto'
Entonces  deberia ver un mensaje "Bienvenid@ a la flota Amancio"

Escenario: Envio fallido con comando '/registrar-cadete Donald, camion'
Cuando envio el mensaje '/registrar-cadete Donald, monopatin'
Entonces deberia ver un mensaje que incluya "Nuestra flota no acepta ese tipo de vehiculo, los vehiculos permitidos son auto, moto o bicicleta."
