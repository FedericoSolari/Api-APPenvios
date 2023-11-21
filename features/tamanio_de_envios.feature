#language: es

@wip
Característica: Como usuario quiero realizar envios de diferentes tamaños
  Regla: para realizar un envio se debe ingresar el tamaño del mismo entre: chico, mediano, grande

    Antecedentes:
      Dado que estoy registrado como cliente

    Escenario: Envio creado con exito con comando '/nuevo-envio chico, Cerrito 628, CP:1010'
      Cuando envio el mensaje '/nuevo-envio chico, Cerrito 628, CP:1010'
      Entonces deberia ver un mensaje que incluya "Se registró tu envio con el ID"

    Escenario: Envio creado con exito con comando '/nuevo-envio mediano, Cerrito 628, CP:1010'
      Cuando envio el mensaje '/nuevo-envio mediano, Cerrito 628, CP:1010'
      Entonces deberia ver un mensaje que incluya "Se registró tu envio con el ID"

    Escenario: Envio creado con exito con comando '/nuevo-envio grande, Cerrito 628, CP:1010'
      Cuando envio el mensaje '/nuevo-envio grande, Cerrito 628, CP:1010'
      Entonces deberia ver un mensaje que incluya "Se registró tu envio con el ID"

    Escenario: Envio fallido con comando '/nuevo-envio enorme, Cerrito 628, CP:1010'
      Cuando envio el mensaje '/nuevo-envio enorme, Cerrito 628, CP:1010'
      Entonces deberia ver un mensaje "Tamaño indicado incorrecto, los tamaños validos son: Chico, Mediano o Grande"

    Escenario: Envio fallido con comando '/nuevo-envio Cerrito 628, CP:1010'
      Cuando envio el mensaje '/nuevo-envio Cerrito 628, CP:1010'
      Entonces deberia ver un mensaje "Falta especificar el tamaño del envio"
