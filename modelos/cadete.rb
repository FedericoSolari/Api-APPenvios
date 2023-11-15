require 'active_model'
class Cadete
  include ActiveModel::Validations

  attr_accessor :id
  attr_accessor :id_cadete, :nombre, :vehiculo

  validates :nombre, presence: true

  def initialize(nombre, vehiculo, id_cadete, id = nil)
    @nombre = nombre
    @vehiculo = vehiculo
    @id_cadete = id_cadete
    @id = id
  end
end
