class ParseadorEstado
  def obtener_mensaje(envio)
    case envio.estado.estado
    when 'pendiente de asignacion'
      "Tu envio (ID: #{envio.id}) se encuentra pendiente de asignación"
    when 'en proceso'
      "Tu envio (ID: #{envio.id}) se encuentra en proceso de entrega. Tiempo estimado: #{envio.tiempo_estimado} minutos"
    when 'entregado'
      "Ya entregamos tu envío (ID: #{envio.id})"
    else
      'Hubo un error al obtener el estado'
    end
  end
end
