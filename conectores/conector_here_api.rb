require 'faraday'
require_relative '../excepciones/conexion_here_api_error'

class ConectorHereApi
  def initialize(api_key)
    @api_key = api_key
    @api_url = ENV['HERE_API_URL']
    @ciudad_de_interes = ENV['CIUDAD']
    @api_version = ENV['HERE_API_VERSION']
  end

  def obtener_direccion(direccion, codigo_postal)
    puts "API URL: #{@api_url}"
    puts "API VERSION: #{@api_version}"
    puts "API CIUDAD: #{@ciudad_de_interes}"
    puts "API KEY: #{@api_key}"
    puts "direccion: #{direccion}"
    puts "codigo postal: #{codigo_postal}"
    begin
      respuesta = Faraday.get("#{@api_url}/#{@api_version}/geocode?q=#{@direccion},#{@codigo_postal}#{@ciudad_de_interes}&apiKey=#{@api_key}")
      parseador_respuesta(respuesta)
    rescue Faraday::Error
      raise ConexionHereApiError
    end
  end

  private

  def parseador_respuesta(respuesta_http)
    JSON.parse(respuesta_http.body)
  end
end
