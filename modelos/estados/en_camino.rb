require_relative './estado'

class EnCamino < Estado
  ESTADO = 'en camino'.freeze

  def initialize
    super(ESTADO)
  end

  def cadete_asignado?
    true
  end

  def se_retiro?
    true
  end

  def se_entrego?
    false
  end
end
