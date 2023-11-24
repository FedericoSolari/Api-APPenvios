require_relative './estado'

class Asignado < Estado
  ESTADO = 'asignado'.freeze

  def initialize
    super(ESTADO)
  end

  def cadete_asignado?
    true
  end

  def se_retiro?
    false
  end

  def se_entrego?
    false
  end
end
