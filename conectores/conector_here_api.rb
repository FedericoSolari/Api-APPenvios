require 'faraday'
require_relative '../excepciones/conexion_here_api_error'

class ConectorHereApi
  def initialize(api_key)
    @api_key = api_key || '-ZgDQiB9BtkuI_pYPTuXDKIEtTX-qjZyPmZJEyVE-Zs'
    @api_url = ENV['HERE_API_URL'] || 'https://geocode.search.hereapi.com'
    @ciudad_de_interes = ENV['CIUDAD'] || 'CABA'
    @api_version = ENV['HERE_API_VERSION'] || 'v1'
  end

  def obtener_direccion(direccion, codigo_postal)
    respuesta = Faraday.get("#{@api_url}/#{@api_version}/geocode?q=#{direccion},#{codigo_postal}#{@ciudad_de_interes}&apiKey=#{@api_key}")
    parseador_respuesta(respuesta)
  rescue Faraday::Error => e
    raise ConexionHereApiError, e.message
  end

  private

  def parseador_respuesta(respuesta_http)
    JSON.parse(respuesta_http.body)
  end
end
