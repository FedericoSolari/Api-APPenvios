require_relative './vehiculo'

class Bicicleta < Vehiculo
  VEHICULO = 'bicicleta'.freeze

  def initialize
    super(VEHICULO)
  end

  def tamanios_permitidos
    %w[chico]
  end
end
