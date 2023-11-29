require 'active_model'
class Cliente
  include ActiveModel::Validations

  attr_accessor :id
  attr_accessor :id_cliente, :nombre, :direccion, :fecha_creacion, :fecha_actualizacion

  validates :nombre, :direccion, :id_cliente, presence: true

  def initialize(nombre, direccion, id_cliente, id = nil)
    @nombre = nombre
    @direccion = direccion
    @id_cliente = id_cliente
    @id = id
  end
end
