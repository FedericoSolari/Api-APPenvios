#language: es

@wip
Característica: Validacion de domicilio

Escenario: Registro fallido al ingresar un domicilio inexistente/invalido
Cuando envio el mensaje '/registrar Juan, noexistedomicilio, CP: nocp'
Entonces deberia ver un mensaje de "El domicilio ingresado no existe"

Escenario: Registro fallido al ingresar un domicilio con datos faltantes
Cuando envio el mensaje '/registrar Juan, Av Las Heras 1232'
Entonces deberia ver un mensaje de "Verifique haber ingresado los datos necesarios, el formato correcto es: \<Domicilio\> \<Altura\>, CP: \<codigo postal\>"

Escenario: Registro exitoso al ingresar direccion valida
Cuando envio el mensaje '/registrar Juan, Av Las Heras 1232, CP: 1425'
Entonces deberia ver un mensaje "Bienvenid@ Juan. Las coordenadas de tu domicilio son: Lat: -27.46715, Lng: -58.99064"
