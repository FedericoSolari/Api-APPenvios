require 'active_model'
require_relative '../fabricas/fabrica_conector_here_api'
require_relative '../excepciones/domicilio_inexistente_error'
require_relative '../excepciones/ciudad_incorrecta_error'

class Direccion
  include ActiveModel::Validations

  attr_accessor :direccion, :codigo_postal, :latitud, :longitud, :id

  validates :direccion, :codigo_postal, presence: true
  validate :validar_direccion

  def initialize(direccion, codigo_postal, id = nil, latitud = nil, longitud = nil)
    @id = id
    @direccion = direccion
    @codigo_postal = codigo_postal
    @latitud = latitud
    @longitud = longitud
    validate!
  end

  # rubocop:disable Metrics/AbcSize
  def validar_direccion
    conector = FabricaConectorHereApi.crear_conector_here_api(ENV['HERE_API_KEY'])
    respuesta = conector.obtener_direccion(@direccion, @codigo_postal.split(':')[1])
    raise DomicilioInexistenteError if respuesta['items'].nil? || respuesta['items'].empty?

    domicilio = respuesta['items'][0]
    ciudad = domicilio['address']['city']
    raise CiudadIncorrectaError if ciudad != 'Ciudad de Buenos Aires'

    coordenadas = domicilio['position']
    @latitud = coordenadas['lat']
    @longitud = coordenadas['lng']
  end
  # rubocop:enable Metrics/AbcSize
end
