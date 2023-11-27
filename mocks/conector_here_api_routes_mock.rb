class ConectorHereApiRoutesMock
  def initialize(api_key)
    @api_key = api_key
  end

  def obtener_duracion_viaje(_latitud_origen, _longitud_origen, _latitud_destino, _longitud_destino, _vehiculo = 'car')
    Duracion.new(126)
  end
end
