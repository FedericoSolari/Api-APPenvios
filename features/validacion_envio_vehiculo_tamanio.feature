#language: es

@wip
Característica: Validacion de asignacion de envio por vehiculo y tamaño
    
    Antecedentes:
    Dado que hay un envio con direccion Cerrito 628, CP: 1010
    Y que estoy registrado como cadete

    Regla: un envio de tamaño chico puede ser entregado por cadete con cualquier vehículo

    Escenario: Cadete con bicicleta es asignado a envio de tamaño chico
        Dado que el envio es de tamanio chico
        Y que tengo bicicleta
        Cuando envio el mensaje "/asignar-envio"
        Entonces deberia ver el id del envio
        Y deberia ver un mensaje que incluya "Cerrito 628, CP: 1010"

    Escenario: Cadete con moto es asignado a envio de tamaño chico
        Dado que el envio es de tamanio chico
        Y que tengo moto
        Cuando envio el mensaje "/asignar-envio"
        Entonces deberia ver el id del envio
        Y deberia ver un mensaje que incluya "Cerrito 628, CP: 1010"

    Escenario: Cadete con auto es asignado a envio de tamaño chico
        Dado que el envio es de tamanio chico
        Y que tengo auto
        Cuando envio el mensaje "/asignar-envio"
        Entonces deberia ver el id del envio
        Y deberia ver un mensaje que incluya "Cerrito 628, CP: 1010"

    Regla: un envio de tamaño mediano puede ser entregado por cadete con moto y auto

    Escenario: Cadete con bicicleta no es asignado a envio de tamaño mediano
        Dado que el envio es de tamanio mediano
        Y que tengo bicicleta
        Cuando envio el mensaje "/asignar-envio"
        Entonces deberia ver un mensaje "No hay envios disponibles"

    Escenario: Cadete con moto es asignado a envio de tamaño mediano
        Dado que el envio es de tamanio mediano
        Y que tengo moto
        Cuando envio el mensaje "/asignar-envio"
        Entonces deberia ver el id del envio
        Y deberia ver un mensaje que incluya "Cerrito 628, CP: 1010"

    Escenario: Cadete con auto es asignado a envio de tamaño mediano
        Dado que el envio es de tamanio mediano
        Y que tengo auto
        Cuando envio el mensaje "/asignar-envio"
        Entonces deberia ver el id del envio
        Y deberia ver un mensaje que incluya "Cerrito 628, CP: 1010"

    Regla: un envio de tamaño grande puede ser entregado por cadete con auto

    Escenario: Cadete con bicicleta no es asignado a envio de tamaño grande
        Dado que el envio es de tamanio grande
        Y que tengo bicicleta
        Cuando envio el mensaje "/asignar-envio"
        Entonces deberia ver un mensaje "No hay envios disponibles"

    Escenario: Cadete con moto no es asignado a envio de tamaño grande
        Dado que el envio es de tamanio grande
        Y que tengo moto
        Cuando envio el mensaje "/asignar-envio"
        Entonces deberia ver un mensaje "No hay envios disponibles"

    Escenario: Cadete con auto es asignado a envio de tamaño grande
        Dado que el envio es de tamanio grande
        Y que tengo auto
        Cuando envio el mensaje "/asignar-envio"
        Entonces deberia ver el id del envio
        Y deberia ver un mensaje que incluya "Cerrito 628, CP: 1010"