class ConectorHereApiRoutesMock
  def initialize(api_key)
    @api_key = api_key
  end

  def obtener_duracion_viaje(_latitud_origen, _longitud_origen, _latitud_destino, _longitud_destino, vehiculo = 'auto')
    case vehiculo
    when 'auto'
      Duracion.new(15 * 60)
    when 'moto'
      Duracion.new(10 * 60)
    when 'bicicleta'
      Duracion.new(25 * 60)
    else
      Duracion.new(126)
    end
  end
end
