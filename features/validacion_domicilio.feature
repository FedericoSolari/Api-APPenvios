#language: es

Característica: Validacion de domicilio

Escenario: Registro fallido al ingresar un domicilio inexistente/invalido
Cuando envio el mensaje '/registrar Juan, noexistedomicilio, CP: 0000'
Entonces deberia ver un mensaje "El domicilio ingresado no existe"

Escenario: Registro fallido al ingresar un domicilio con datos faltantes
Cuando envio el mensaje '/registrar Juan, Av Las Heras 1232'
Entonces deberia ver un mensaje "Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>"

Escenario: Registro exitoso al ingresar direccion valida
Cuando envio el mensaje '/registrar Juan, Av Las Heras 1232, CP: 1425'
Entonces deberia ver un mensaje "Bienvenid@ Juan. Las coordenadas de tu domicilio son: Lat: -34.59218, Lng: -58.39141"
