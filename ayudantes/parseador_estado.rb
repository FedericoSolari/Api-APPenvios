class ParseadorEstado
  def obtener_mensaje(envio)
    case envio.estado.estado
    when 'pendiente de asignacion'
      "Tu envio (ID: *#{envio.id}*) se encuentra *pendiente de asignación*"
    when 'asignado'
      "Tu envio (ID: *#{envio.id}*) fue asignado a *#{envio.cadete.nombre}*, ya está en camino!"
      # "Tu envio (ID: *#{envio.id}*) se encuentra en *proceso de entrega*. " \
      #  "\nTiempo estimado: *#{envio.tiempo_estimado} minutos*"
    when 'entregado'
      "Ya entregamos tu envio (ID: *#{envio.id}*)"
    else
      'Hubo un error al obtener el estado'
    end
  end
end
