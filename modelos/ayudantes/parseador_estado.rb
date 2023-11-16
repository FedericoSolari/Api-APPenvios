class ParseadorEstado
  def obtener_mensaje(id_envio, estado)
    case estado
    when 'pendiente de asignacion'
      "Tu envio (ID: #{id_envio}) se encuentra pendiente de asignación"
    when 'en proceso'
      "Tu envio (ID: #{id_envio}) se encuentra en proceso de entrega"
    else
      'Hubo un error al obtener el estado'
    end
  end
end
