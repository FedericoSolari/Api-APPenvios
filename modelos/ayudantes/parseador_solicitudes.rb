class ParseadorSolicitudes
  def parsear(mensaje)
    comando, *_parametros = mensaje.split
    case comando
    when '/registrar'
      regex = %r{^(/registrar)\s+(\w+),\s+(.*?),\s+(CP:\s+\d+),\s+(\d+)$}
    when '/registrar_cadete'
      regex = %r{^(/registrar_cadete)\s+(\w+),\s+(\w+),\s+(\d+)$}
    end
    mensaje.match(regex)
  end
end
