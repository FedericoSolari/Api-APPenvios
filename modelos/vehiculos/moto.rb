require_relative './vehiculo'

class Moto < Vehiculo
  VEHICULO = 'moto'.freeze

  def initialize
    super(VEHICULO)
  end

  def tamanios_permitidos
    %w[chico mediano]
  end
end
