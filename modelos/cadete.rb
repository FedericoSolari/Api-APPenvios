require 'active_model'
class Cadete
  include ActiveModel::Validations

  attr_accessor :id, :nombre, :vehiculo

  validates :nombre, presence: true

  def initialize(nombre, vehiculo, id = nil)
    @nombre = nombre
    @vehiculo = vehiculo
    @id = id
  end
end
