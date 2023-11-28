require_relative './vehiculo'

class Bicicleta < Vehiculo
  VEHICULO = 'bicicleta'.freeze

  def initialize
    super(VEHICULO)
  end
end
