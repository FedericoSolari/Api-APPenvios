#language: es

Característica: Como cliente quiero ver un informe de mis envios realizados

Antecedentes:
Dado que estoy registrado como cliente
Y hay 5 envios creados

Escenario: Al mandar comando '/historial' se muestra resumen de ultimos 5 envios realizados por el cliente
Cuando se envia el mensaje '/historial'
Y deberia ver mensajes que incluyan 'Envio: '
Y deberia ver mensajes que incluyan 'Tamaño: '
Y deberia ver mensajes que incluyan 'Direccion destino: '
Y deberia ver mensajes que incluyan 'Cadete asignado: '
Y deberia ver mensajes que incluyan 'Estado: '
Y deberia ver mensajes que incluyan 'Tipo: '
