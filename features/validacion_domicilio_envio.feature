#language: es

Característica: Validar domicilio en la creacion de un envio

  Antecedentes:
    Dado que estoy registrado como cliente

  Escenario: Registro fallido al ingresar un domicilio inexistente/invalido
    Cuando envio el mensaje '/nuevo-envio chico, noexistedomicilio, CP: 0000'
    Entonces deberia ver un mensaje "El domicilio ingresado no existe"

  Escenario: Registro fallido al ingresar un domicilio con datos faltantes
    Cuando envio el mensaje '/nuevo-envio chico, Cerrito 628'
    Entonces deberia ver un mensaje "Verifique haber ingresado los datos necesarios, el formato correcto es: \<Tamaño\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>"

  Escenario: Registro exitoso al ingresar direccion valida
    Cuando envio el mensaje '/nuevo-envio chico, Cerrito 628, CP: 1049'
    Entonces deberia ver un mensaje que incluya "Se registró tu envio con el ID:"
    Entonces deberia ver un mensaje que incluya "Lat: -34.59218 Lng: -58.39141"
