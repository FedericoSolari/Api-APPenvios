#language: es

@wip
Característica: Como cliente no puedo ver el estado de un envio ageno
Antecedentes:
Dado que hay un envio creado

Escenario: cuando cliente busca estado de envio no realizado por el devuelve mensaje de 'no se encontró un envio con ID'
Dado que estoy registrado como cliente
Y no tengo envios asociados
Cuando consulto el estado del envio que esta creado
Entonces deberia ver un mensaje que incluya "No tenes envios asociados con ese ID"
