class ParseadorSolicitudes
  def parsear(mensaje)
    regex = %r{^(/\w+)\s+(\w+),\s+(.*?),\s+(CP:\s+\d+),\s+(\d+)$}
    mensaje.match(regex)
  end
end
