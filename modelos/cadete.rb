require 'active_model'
class Cadete
  include ActiveModel::Validations

  attr_accessor :id
  attr_accessor :id_cadete, :nombre, :vehiculo, :fecha_creacion, :fecha_actualizacion

  validates :nombre, :vehiculo, :id_cadete, presence: true

  def initialize(nombre, vehiculo, id_cadete, id = nil)
    @nombre = nombre
    @vehiculo = vehiculo
    @id_cadete = id_cadete
    @id = id
  end

  def tamanios_aceptados
    @vehiculo.tamanios_permitidos
  end
end
