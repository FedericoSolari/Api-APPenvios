#language: es


@wip
Característica: Como cadete quiero solicitar ser asignado a un envio
Antecedentes:
Dado Que estoy registrado como cadete
Dado Hay un envio sin asignar con ID 1
Y Con domicilio origen "Av Las Heras 1232, CP: 1425" y destino "Av Las Heras 3361, CP: 1425"

Escenario: Asignación básica de cadete
Cuando Mando el comando "/asignar-envio"
Entonces Te asignamos el siguiente envio con el ID 1
Y Veo el domicilio origen y destino
