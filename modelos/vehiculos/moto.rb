require_relative './vehiculo'

class Moto < Vehiculo
  VEHICULO = 'moto'.freeze

  def initialize
    super(VEHICULO)
  end
end
