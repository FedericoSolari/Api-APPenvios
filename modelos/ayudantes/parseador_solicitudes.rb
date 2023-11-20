class ParseadorSolicitudes
  def parsear(mensaje)
    comando, *_parametros = mensaje.split
    case comando
    when '/registrar'
      if mensaje.split(',')[2].nil? # no tiene codigo postal
        generar_cuerpo_solicitud_cliente_sin_codigo_postal(mensaje)
      else
        regex = %r{^(/registrar)\s+(\w+),\s+(.*?),\s+(CP:\s+\d+)$}
        generar_cuerpo_solicitud_cliente(mensaje.match(regex))
      end
    when '/registrar-cadete'
      regex = %r{^(/registrar-cadete)\s+(\w+),\s+(\w+)$}
      generar_cuerpo_solicitud_cadete(mensaje.match(regex))
    when '/nuevo-envio'
      regex = %r{^(/nuevo-envio)\s+(.*?),\s+(CP:\s+\d+)$}
      generar_cuerpo_solicitud_creacion_envio(mensaje.match(regex))
    end
  end

  private

  def generar_cuerpo_solicitud_cliente(parametros)
    { comando: parametros[1], body: { nombre: parametros[2], direccion: parametros[3], codigo_postal: parametros[4] } }
  end

  def generar_cuerpo_solicitud_cadete(parametros)
    { comando: '/registrar_cadete', body: { nombre: parametros[2], vehiculo: parametros[3] } }
  end

  def generar_cuerpo_solicitud_creacion_envio(parametros)
    { comando: '/envios', body: { direccion: parametros[2], codigo_postal: parametros[3], id_cliente: 8 } }
  end

  def generar_cuerpo_solicitud_cliente_sin_codigo_postal(parametros)
    { comando: '/registrar', body: { direccion: parametros.split(',')[1], codigo_postal: parametros.split(',')[2] } }
  end
end
