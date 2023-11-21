require_relative './estado'

class EnProceso < Estado
  ESTADO = 'en proceso'.freeze

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
