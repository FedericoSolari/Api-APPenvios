class EnProceso
  ESTADO = 'en proceso'.freeze

  def initialize
    @estado = ESTADO
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

  def obtener_estado
    @estado
  end
end
