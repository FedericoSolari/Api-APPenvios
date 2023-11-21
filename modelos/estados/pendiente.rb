require_relative './estado'

class Pendiente < Estado
  ESTADO = 'pendiente de asignacion'.freeze

  def initialize
    super(ESTADO)
  end

  def cadete_asignado?
    false
  end

  def se_retiro?
    false
  end

  def se_entrego?
    false
  end
end
