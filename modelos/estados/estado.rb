class Estado
  attr_accessor :estado

  def initialize(estado)
    @estado = estado
  end

  def cambiar_a_estado(_estado)
    raise NotImplementedError, 'Debería ser implementado por una clase hija'
  end

  def cambiar_pendiente
    raise NotImplementedError, 'Debería ser implementado por una clase hija'
  end

  def cambiar_asignado
    raise NotImplementedError, 'Debería ser implementado por una clase hija'
  end

  def cambiar_en_camino
    raise NotImplementedError, 'Debería ser implementado por una clase hija'
  end

  def cambiar_entregado
    raise NotImplementedError, 'Debería ser implementado por una clase hija'
  end
end
