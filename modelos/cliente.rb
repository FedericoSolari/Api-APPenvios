require 'active_model'
class Cliente
  include ActiveModel::Validations

  attr_accessor :id, :nombre, :direccion, :codigo_postal

  validates :nombre, presence: true

  def initialize(nombre, direccion, codigo_postal)
    @nombre = nombre
    @direccion = direccion
    @codigo_postal = codigo_postal
  end
end
