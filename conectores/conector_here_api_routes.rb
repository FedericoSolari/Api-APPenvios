require 'faraday'
require_relative '../excepciones/conexion_here_api_error'
require_relative '../modelos/duracion'
require 'dotenv'
Dotenv.load('.env')

class ConectorHereApiRoutes
  VEHICULO_EN_INGLES = {
    'auto' => 'car',
    'moto' => 'scooter',
    'bicicleta' => 'bicycle'
  }.freeze

  def initialize(api_key, tipo_de_retorno = 'summary')
    @api_key = api_key || ENV['HERE_API_KEY']
    @api_url = ENV['HERE_API_ROUTES_URL'] || 'https://router.hereapi.com/v8/routes'
    @tipo_de_retorno = tipo_de_retorno
  end

  def obtener_duracion_viaje(latitud_origen, longitud_origen, latitud_destino, longitud_destino, vehiculo)
    origen = "#{latitud_origen}%2C#{longitud_origen}"
    destino = "#{latitud_destino}%2C#{longitud_destino}"
    vehiculo = VEHICULO_EN_INGLES[vehiculo]
    respuesta = Faraday.get("#{@api_url}?apiKey=#{@api_key}&return=#{@tipo_de_retorno}&transportMode=#{vehiculo}&origin=#{origen}&destination=#{destino}")
    respuesta_parseada = parseador_respuesta(respuesta)
    Duracion.new(respuesta_parseada['routes'][0]['sections'][0]['summary']['duration'])
  rescue Faraday::Error => e
    raise ConexionHereApiError, e.message
  end

  private

  def parseador_respuesta(respuesta_http)
    JSON.parse(respuesta_http.body)
  end
end
