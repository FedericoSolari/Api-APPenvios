#language: es

Característica: Registro como cliente

    Regla: para registrarse un cliente debe ingresar una dirección y su código postal

    Escenario: Registro exitoso de cliente con comando '/registrar Juan, Av Las Heras 1232, CP: 1018'   
        Dado que no hay un cliente con el nombre "Juan"
        Cuando envio el mensaje '/registrar Juan, Av Las Heras 1232, CP: 1018'
        Entonces deberia ver un mensaje "Bienvenid@ Juan. Las coordenadas de tu domicilio son: Lat: -34.59218, Lng: -58.39141"
