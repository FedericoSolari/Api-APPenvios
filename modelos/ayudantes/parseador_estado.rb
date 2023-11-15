class ParseadorEstado
  def obtener_mensaje(id_envio, mensaje)
    case mensaje
    when 'pendiente de asignacion'
      "Tu envio (ID: #{id_envio}) se encuentra pendiente de asignación"
    when 'en proceso'
      "Tu envio (ID: #{id_envio}) se encuentra en proceso de entrega"
    end
  end
end
