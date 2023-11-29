#language: es
Característica: Seleccionar tipo de envio

    Escenario: Envio creado con exito con comando '/nuevo-envio clasico, Chico, Cerrito 628, CP:1049'
        Dado que estoy registrado como cliente
        Cuando envio el mensaje '/nuevo-envio clasico, Chico, Cerrito 628, CP: 1049'
        Entonces deberia ver un mensaje que incluya "Se registró tu envio con el ID"

    Escenario: Envio creado con exito con comando '/nuevo-envio express, Chico, Cerrito 628, CP:1049'
        Dado que estoy registrado como cliente
        Cuando envio el mensaje '/nuevo-envio express, Chico, Cerrito 628, CP: 1049'
        Entonces deberia ver un mensaje que incluya "Se registró tu envio con el ID"

    Escenario: cuando hay un envio clasico y uno express se asigna primero el express
        Dado que hay un envio "clasico" con direccion "Av Las Heras 1232", "CP: 1018"
        Y que hay un envio "express" con direccion "Cerrito 628", "CP: 1049"
        Y que estoy registrado como cadete
        Cuando envio el comando "/asignar-envio"
        Entonces deberia ver un mensaje que incluya "Cerrito 628, CP: 1049"
