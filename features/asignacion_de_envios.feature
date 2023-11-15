#language: es


# @wip
Característica: Como cadete quiero solicitar ser asignado a un envio
Antecedentes:
Dado Que hay un cliente
Dado Que estoy registrado como cadete
Dado Que hay un envio sin asignar con ID
Y Con domicilio origen "Av Las Heras 1232", "CP: 1425" y destino "Av Las Heras 3361", "CP: 1425"

Escenario: Asignación básica de cadete
Cuando Mando el comando "/asignar_envio"
Entonces Te asignamos el siguiente envio
Y Veo el domicilio origen y destino
