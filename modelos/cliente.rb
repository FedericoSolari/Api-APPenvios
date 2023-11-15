require 'active_model'
class Cliente
  include ActiveModel::Validations

  attr_accessor :id, :id_cliente, :nombre, :direccion, :codigo_postal

  validates :nombre, presence: true

  def initialize(nombre, direccion, codigo_postal, id_cliente, id = nil)
    @nombre = nombre
    @direccion = direccion
    @codigo_postal = codigo_postal
    @id_cliente = id_cliente
    @id = id
  end
end
