#language: es
@wip
Característica: Seleccionar tipo de envio

Escenario: Envio creado con exito con comando '/nuevo-envio clasico, Chico, Cerrito 628, CP:1010'
Dado que estoy registrado como cliente
Cuando envio el mensaje '/nuevo-envio clasico, Chico, Cerrito 628, CP:1010'
Entonces deberia ver un mensaje de registro de envio correcto

Escenario: Envio creado con exito con comando '/nuevo-envio express, Chico, Cerrito 628, CP:1010'
Dado que estoy registrado como cliente
Cuando envio el mensaje '/nuevo-envio express, Chico, Cerrito 628, CP:1010'
Entonces deberia ver un mensaje de registro de envio correcto

Escenario: cuando hay un envio clasico y uno express se asigna primero el express
Dado que hay un envio clasico con direccion Av Las Heras 1232, CP: 1425
Y que hay un envio express con direccion Cerrito 628, CP: 1010
Y que estoy registrado como cadete
Cuando envio el mensaje '/asignar-envio'Entonces deberia ver un mensaje que incluya Cerrito 628, CP: 1010
