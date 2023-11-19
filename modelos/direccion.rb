require 'active_model'

class Direccion
  include ActiveModel::Validations

  attr_accessor :id
  attr_accessor :direccion, :codigo_postal

  validate :validar_direccion

  def initialize(direccion, codigo_postal)
    @direccion = direccion
    @codigo_postal = codigo_postal.split(':')[1].strip
    # @codigo_postal = codigo_postal
  end

  def validar_direccion
    respuesta = Faraday.get("https://geocode.search.hereapi.com/v1/geocode?q=#{@direccion},#{@codigo_postal}CABA&apiKey=#{ENV['HERE_API_KEY']}")
    body = JSON.parse(respuesta.body)
    raise 'La direccion no fue encontrada.' if body['items'].empty?

    ciudad = body['items'][0]['address']['city']
    raise 'La direccion no se encuentra en CABA.' if ciudad != 'Ciudad de Buenos Aires'
  end
end
