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
      if mensaje.split(',')[3].nil? # no tiene codigo postal
        generar_cuerpo_solicitud_creacion_envio_sin_codigo_postal(mensaje)
      else
        regex = %r{^/nuevo-envio\s+(\w+),\s+(\w+),\s+([^\n]+),\s+CP:\s+(\d+)$}
        generar_cuerpo_solicitud_creacion_envio(mensaje.match(regex))
      end
    end
  end

  private

  def generar_cuerpo_solicitud_cliente(parametros)
    { comando: '/clientes', body: { nombre: parametros[2], direccion: parametros[3], codigo_postal: parametros[4], id_cliente: 8 } }
  end

  def generar_cuerpo_solicitud_cadete(parametros)
    { comando: '/cadetes', body: { nombre: parametros[2], vehiculo: parametros[3], id_cadete: 2 } }
  end

  def generar_cuerpo_solicitud_creacion_envio(parametros)
    { comando: '/envios', body: { tipo: parametros[1], tamanio: parametros[2], direccion: parametros[3], codigo_postal: parametros[4], id_cliente: 8 } }
  end

  def generar_cuerpo_solicitud_cliente_sin_codigo_postal(parametros)
    { comando: '/clientes', body: { tamanio: parametros.split(',')[0].split(' ')[1], direccion: parametros.split(',')[1], codigo_postal: parametros.split(',')[2], id_cliente: 8 } }
  end

  def generar_cuerpo_solicitud_creacion_envio_sin_codigo_postal(parametros)
    { comando: '/envios', body: { tipo: parametros.split(',')[0].split(' ')[1], tamanio: parametros.split(',')[1].split(' ')[0], direccion: parametros.split(',')[2], codigo_postal: parametros.split(',')[3], id_cliente: 8 } }
  end
end
