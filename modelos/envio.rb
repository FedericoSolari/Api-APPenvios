require 'active_model'
require_relative 'direccion'
require_relative 'estados/pendiente'
require_relative 'estados/entregado'
require_relative 'estados/asignado'
require_relative '../fabricas/fabrica_conector_here_api_routes'

class Envio
  include ActiveModel::Validations

  attr_accessor :id, :cadete
  attr_accessor :tamanio, :direccion, :cliente, :estado, :duenio

  validates :direccion, presence: true
  def initialize(tamanio, direccion, cliente, tipo, id = nil)
    @tamanio = tamanio
    @direccion = direccion
    @cliente = cliente
    @cadete = nil
    @id = id
    @estado = Pendiente.new
    @duenio = cliente.nombre
    @tipo = tipo
  end

  def tiempo_estimado
    conector = FabricaConectorHereApiRoutes.crear_conector_here_api_routes(ENV['HERE_API_KEY'])
    duracion = conector.obtener_duracion_viaje(@cliente.direccion.latitud, @cliente.direccion.longitud,
                                               @direccion.latitud, @direccion.longitud, @cadete.vehiculo.vehiculo)
    duracion.minutos
  end
end
