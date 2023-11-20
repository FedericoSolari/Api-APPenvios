require 'active_model'
require_relative 'direccion'
class Envio
  include ActiveModel::Validations

  attr_accessor :id, :id_cadete
  attr_accessor :direccion, :codigo_postal, :id_cliente, :estado

  validates :direccion, presence: true
  # rubocop:disable Metrics/ParameterLists
  def initialize(direccion, codigo_postal, id_cliente, id_cadete = nil, id = nil, estado = 'pendiente de asignacion')
    @direccion = Direccion.new(direccion, codigo_postal)
    @id_cliente = id_cliente
    @id_cadete = id_cadete
    @id = id
    @estado = estado
  end
  # rubocop:enable Metrics/ParameterLists

  def asignar_cadete(id_cadete)
    @id_cadete = id_cadete
    @estado = 'en proceso'
  end
end
