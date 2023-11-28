require_relative './estado'

class Asignado < Estado
  ESTADO = 'asignado'.freeze

  def initialize
    super(ESTADO)
  end

  def cambiar_pendiente
    self
  end

  def cambiar_asignado
    raise CambioEstadoInvalidoError, 'El envio ya se encuentra asignado.'
  end
end
