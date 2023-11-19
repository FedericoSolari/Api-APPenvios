require 'active_model'
require_relative '../conectores/conector_here_api'

class Direccion
  include ActiveModel::Validations

  attr_accessor :id
  attr_accessor :direccion, :codigo_postal

  validate :validar_direccion

  def initialize(direccion, codigo_postal)
    @direccion = direccion
    @codigo_postal = codigo_postal.split(':')[1].strip
  end

  def validar_direccion
    conector = ConectorHereApi.new(ENV['HERE_API_KEY'])
    begin
      respuesta = conector.obtener_direccion(@direccion, @codigo_postal)
    rescue StandardError
      raise 'La direccion no fue encontrada.' if respuesta['items'].empty?
    end

    ciudad = respuesta['items'][0]['address']['city']
    raise 'La direccion no se encuentra en CABA.' if ciudad != 'Ciudad de Buenos Aires'
  end
end
