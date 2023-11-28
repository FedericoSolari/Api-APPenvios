require_relative './vehiculo'

class Auto < Vehiculo
  VEHICULO = 'auto'.freeze

  def initialize
    super(VEHICULO)
  end
end
