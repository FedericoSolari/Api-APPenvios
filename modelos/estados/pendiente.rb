class Pendiente
  ESTADO = 'pendiente de asignacion'.freeze

  def initialize
    @estado = ESTADO
  end

  def cadete_asignado?
    false
  end
end
