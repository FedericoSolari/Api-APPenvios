require 'active_model'
require_relative 'direccion'
require_relative 'estados/pendiente'
require_relative 'estados/entregado'
require_relative 'estados/en_proceso'

class Envio
  include ActiveModel::Validations

  attr_accessor :id, :cadete
  attr_accessor :tamanio, :direccion, :cliente, :estado

  validates :direccion, presence: true
  # rubocop:disable Metrics/ParameterLists
  def initialize(tamanio, direccion, cliente, cadete = nil, id = nil, estado = Pendiente.new)
    @tamanio = tamanio
    @direccion = direccion
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
