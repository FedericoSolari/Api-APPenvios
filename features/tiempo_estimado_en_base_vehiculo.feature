#language: es

@wip
Característica: Tiempo estimado del envio sea en base al vehiculo
    Antecedentes:
        Dado que estoy registrado como cliente
        Y que hay registrado un cadete
        Y hay un envio con direccion "Cerrito 628", "CP: 1049"
        Y con estado "asignado"
        
        Escenario: cuando realizo entrega con bicicleta me muestra el tiempo estimado
            Dado que el cadete tiene el vehiculo "bicicleta"
            Y el envio tiene una duracion de "25" minutos
            Cuando mando el mensaje "/estado-envio ID"
            Entonces deberia ver un mensaje que incluya "se encuentra en camino al domicilio"
            Y deberia ver el id del envio
            Y deberia ver un mensaje que incluya "Tiempo estimado: 25"

        Escenario: cuando realizo entrega con moto me muestra el tiempo estimado
            Dado que el cadete tiene el vehiculo "moto"
            Y el envio tiene una duracion de "10" minutos
            Cuando mando el mensaje "/estado-envio ID"
            Entonces deberia ver un mensaje que incluya "se encuentra en camino al domicilio"
            Y deberia ver el id del envio
            Y deberia ver un mensaje que incluya "Tiempo estimado: 10"

        Escenario: cuando realizo entrega con auto me muestra el tiempo estimado
            Dado que el cadete tiene el vehiculo "bicicleta"
            Y el envio tiene una duracion de "15" minutos
            Cuando mando el mensaje "/estado-envio ID"
            Entonces deberia ver un mensaje que incluya "se encuentra en camino al domicilio"
            Y deberia ver el id del envio
            Y deberia ver un mensaje que incluya "Tiempo estimado: 15"