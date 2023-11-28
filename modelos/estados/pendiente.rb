require_relative './estado'
require_relative '../../excepciones/cambio_estado_invalido_error'

class Pendiente < Estado
  ESTADO = 'pendiente de asignacion'.freeze

  def initialize
    super(ESTADO)
  end

  def cambiar_pendiente
    raise CambioEstadoInvalidoError, 'El envio ya se encuentra en estado pendiente de asignación.'
  end

  def cambiar_asignado
    raise CambioEstadoInvalidoError, 'El envio ya se encuentra asignado.'
  end
end
