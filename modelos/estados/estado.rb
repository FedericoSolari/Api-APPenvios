class Estado
  attr_accessor :estado

  def initialize(estado)
    @estado = estado
  end

  def cambiar_a_estado(_estado)
    raise NotImplementedError, 'Must be implemented in child class .'
  end
end
