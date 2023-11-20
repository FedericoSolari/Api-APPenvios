require 'active_model'
require_relative '../fabrica/fabrica_conector_here_api'
require_relative '../excepciones/domicilio_inexistente_error'
require_relative '../excepciones/ciudad_incorrecta_error'

class Direccion
  include ActiveModel::Validations

  attr_accessor :direccion, :codigo_postal

  validates :direccion, :codigo_postal, presence: true
  validate :validar_direccion

  def initialize(direccion, codigo_postal)
    @direccion = direccion
    @codigo_postal = codigo_postal
    validate!
  end

  def validar_direccion
    conector = FabricaConectorHereApi.crear_conector_here_api(ENV['HERE_API_KEY'])
    codigo_postal = @codigo_postal.split(':')[1]
    respuesta = conector.obtener_direccion(@direccion, codigo_postal)
    raise DomicilioInexistenteError if respuesta[:items].nil? || respuesta[:items].empty?

    ciudad = respuesta[:items][0][:address][:city]
    raise CiudadIncorrectaError if ciudad != 'Ciudad de Buenos Aires'
  end
end
