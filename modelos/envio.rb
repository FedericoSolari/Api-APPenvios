require 'active_model'
require_relative 'direccion'
class Envio
  include ActiveModel::Validations

  attr_accessor :id, :cadete
  attr_accessor :direccion, :codigo_postal, :cliente, :estado

  validates :direccion, presence: true
  # rubocop:disable Metrics/ParameterLists
  def initialize(direccion, codigo_postal, cliente, cadete = nil, id = nil, estado = 'pendiente de asignacion')
    @direccion = Direccion.new(direccion, codigo_postal)
    @cliente = cliente
    @cadete = cadete
    @id = id
    @estado = estado
  end
  # rubocop:enable Metrics/ParameterLists

  def asignar_cadete(cadete)
    @cadete = cadete
  end

  def con_estado(estado)
    @estado = estado
  end
end
