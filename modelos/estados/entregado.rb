class Entregado
  ESTADO = 'entregado'.freeze

  def initialize
    @estado = ESTADO
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

  def obtener_estado
    @estado
  end
end
