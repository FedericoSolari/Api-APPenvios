require_relative './vehiculo'

class Auto < Vehiculo
  VEHICULO = 'auto'.freeze

  def initialize
    super(VEHICULO)
  end

  def tamanios_permitidos
    %w[chico mediano grande]
  end
end
