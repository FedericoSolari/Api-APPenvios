require 'active_model'
require_relative 'direccion'
require_relative 'estados/pendiente'
require_relative 'estados/entregado'
require_relative 'estados/asignado'
require_relative '../fabricas/fabrica_conector_here_api_routes'

class Envio
  include ActiveModel::Validations

  attr_accessor :id, :cadete
  attr_accessor :tamanio, :direccion, :cliente, :estado

  validates :direccion, presence: true
  def initialize(tamanio, direccion, cliente, id = nil)
    @tamanio = tamanio
    @direccion = direccion
    @cliente = cliente
    @id = id
    @estado = Pendiente.new
  end

  def tiempo_estimado
    conector = FabricaConectorHereApiRoutes.crear_conector_here_api_routes(ENV['HERE_API_KEY'])
    respuesta = conector.obtener_duracion_viaje(@cliente.direccion.latitud, @cliente.direccion.longitud,
                                                @direccion.latitud, @direccion.longitud)
    secciones = respuesta['routes'][0]['sections']
    resumen_seccion = secciones[0]['summary']
    resumen_seccion['duration'] / 60
  end
end
