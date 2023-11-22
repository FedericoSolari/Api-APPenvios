require 'faraday'
require_relative '../excepciones/conexion_here_api_error'

class ConectorHereApiRoutes
  def initialize(api_key)
    @api_key = api_key || '-ZgDQiB9BtkuI_pYPTuXDKIEtTX-qjZyPmZJEyVE-Zs'
    @api_url = ENV['HERE_API_ROUTES_URL'] || 'https://router.hereapi.com/v8/routes'
  end

  def obtener_duracion_viaje(origen, destino, tipo_de_retorno = 'summary', vehiculo = 'car')
    respuesta = Faraday.get("#{@api_url}?apiKey=#{@api_key}&return=#{tipo_de_retorno}&transportMode=#{vehiculo}&origin=#{origen}&destination=#{destino}")
    parseador_respuesta(respuesta)
  rescue Faraday::Error => e
    raise ConexionHereApiError, e.message
  end

  private

  def parseador_respuesta(respuesta_http)
    JSON.parse(respuesta_http.body)
  end
end
