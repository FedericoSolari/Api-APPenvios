require 'active_model'
class Envio
  include ActiveModel::Validations

  attr_accessor :direccion, :codigo_postal, :id_cliente, :id

  validates :direccion, presence: true

  def initialize(direccion, codigo_postal, id_cliente, id = nil)
    @direccion = direccion
    @codigo_postal = codigo_postal
    @id_cliente = id_cliente
    @id = id
  end
end
