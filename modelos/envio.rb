require 'active_model'
class Envio
  include ActiveModel::Validations

  attr_accessor :id, :id_cadete
  attr_reader :direccion, :codigo_postal, :id_cliente

  validates :direccion, presence: true

  def initialize(direccion, codigo_postal, id_cliente, id_cadete = nil, id = nil)
    @direccion = direccion
    @codigo_postal = codigo_postal
    @id_cliente = id_cliente
    @id_cadete = id_cadete
    @id = id
  end
end
