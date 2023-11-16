#language: es

Característica: Como cliente quiero realizar envios
Regla: para realizar un envio se debe ingresar una dirección y su código postal

Antecedentes:
Dado que estoy registrado como cliente
Y que no hay envios creados

Escenario: Envio creado con exito con comando '/nuevo-envio Cerrito 628, CP:1010'
Cuando envio el mensaje '/nuevo-envio Cerrito 628, CP:1010'
Entonces deberia ver un mensaje que incluya "Se registró tu envio con el ID"
