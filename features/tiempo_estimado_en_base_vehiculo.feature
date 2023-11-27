#language: es

Característica: Tiempo estimado del envio sea en base al vehiculo
    Antecedentes:
        Dado que estoy registrado como cliente
        Y que hay registrado un cadete
        Y hay un envio con direccion "Cerrito 628", "CP: 1049"
        Y con estado "en camino"
        
        Escenario: cuando realizo entrega con bicicleta me muestra el tiempo estimado
            Dado que el cadete tiene el vehiculo "bicicleta"
            Cuando mando el mensaje "/estado-envio ID"
            Entonces deberia ver un mensaje que incluya "se encuentra en camino al domicilio"
            Y deberia ver el id del envio
            Y deberia ver un mensaje que incluya "Tiempo estimado: 25 minutos"

        Escenario: cuando realizo entrega con moto me muestra el tiempo estimado
            Dado que el cadete tiene el vehiculo "moto"
            Cuando mando el mensaje "/estado-envio ID"
            Entonces deberia ver un mensaje que incluya "se encuentra en camino al domicilio"
            Y deberia ver el id del envio
            Y deberia ver un mensaje que incluya "Tiempo estimado: 10 minutos"

        Escenario: cuando realizo entrega con auto me muestra el tiempo estimado
            Dado que el cadete tiene el vehiculo "auto"
            Cuando mando el mensaje "/estado-envio ID"
            Entonces deberia ver un mensaje que incluya "se encuentra en camino al domicilio"
            Y deberia ver el id del envio
            Y deberia ver un mensaje que incluya "Tiempo estimado: 15 minutos"