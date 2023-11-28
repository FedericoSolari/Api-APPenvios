require_relative './estado'

class Asignado < Estado
  ESTADO = 'asignado'.freeze

  def initialize
    super(ESTADO)
  end

  def cambiar_pendiente
    self
  end
end
