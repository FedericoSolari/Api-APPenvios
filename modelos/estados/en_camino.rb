require_relative './estado'

class EnCamino < Estado
  ESTADO = 'en camino'.freeze

  def initialize
    super(ESTADO)
  end
end
