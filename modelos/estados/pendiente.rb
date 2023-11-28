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

  def cambiar_en_camino
    raise CambioEstadoInvalidoError, 'El envio ya se encuentra en camino a la dirección de entrega.'
  end

  def cambiar_entregado
    raise CambioEstadoInvalidoError, 'El envio ya ha sido entregado.'
  end
end
