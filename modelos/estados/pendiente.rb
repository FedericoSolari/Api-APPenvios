require_relative './estado'

class Pendiente < Estado
  ESTADO = 'pendiente de asignacion'.freeze

  def initialize
    super(ESTADO)
  end
end
