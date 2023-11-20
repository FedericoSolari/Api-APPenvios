#language: es

@wip
Característica: Validar domicilio en la creacion de un envio

  Escenario: Registro fallido al ingresar un domicilio inexistente/invalido
    Cuando envio el mensaje '/nuevo-envio Juan, noexistedomicilio, CP: nocp'
    Entonces deberia ver un mensaje de "El domicilio ingresado no existe"

  Escenario: Registro fallido al ingresar un domicilio con datos faltantes
    Cuando envio el mensaje '/nuevo-envio Juan, Av Las Heras 1232'
    Entonces deberia ver un mensaje "Verifique haber ingresado los datos necesarios, el formato correcto es: <Domicilio> <Altura>, CP: <codigo postal>"

  Escenario: Registro exitoso al ingresar direccion valida
    Cuando envio el mensaje '/nuevo-envio Juan, Av Las Heras 1232, CP: 1425'
    Entonces deberia ver un mensaje ""Se registró tu envio con el ID". Las coordenadas del domicilio de entrega son: Lat: -27.46715, Lng: -58.99064"
