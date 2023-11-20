#language: es

Característica: Validar domicilio en la creacion de un envio

  Antecedentes:
    Dado que estoy registrado como cliente

  Escenario: Registro fallido al ingresar un domicilio inexistente/invalido
    Cuando envio el mensaje '/nuevo-envio noexistedomicilio, CP: 0000'
    Entonces deberia ver un mensaje "El domicilio ingresado no existe"

  Escenario: Registro fallido al ingresar un domicilio con datos faltantes
    Cuando envio el mensaje '/nuevo-envio Cerrito 628'
    Entonces deberia ver un mensaje "Verifique haber ingresado los datos necesarios, el formato correcto es: <Domicilio> <Altura>, CP: <codigo postal>"

  @wip
  Escenario: Registro exitoso al ingresar direccion valida
    Cuando envio el mensaje '/nuevo-envio Cerrito 628, CP:1010'
    Entonces deberia ver un mensaje "Se registró tu envio con el ID. Las coordenadas del domicilio de entrega son: Lat: -27.46715, Lng: -58.99064"
