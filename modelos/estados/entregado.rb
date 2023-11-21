require_relative './estado'

class Entregado < Estado
  ESTADO = 'entregado'.freeze

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
    true
  end
end
