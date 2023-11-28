require_relative './estado'

class EnCamino < Estado
  ESTADO = 'en camino'.freeze

  def initialize
    super(ESTADO)
  end

  def cambiar_pendiente
    raise CambioEstadoInvalidoError, 'No se puede confirmar el retiro. El envío aún no tiene un cadete asignado.'
  end

  def cambiar_asignado
    self
  end

  def cambiar_en_camino
    raise CambioEstadoInvalidoError, 'El envio ya se encuentra en camino a la dirección de entrega.'
  end

  def cambiar_entregado
    raise CambioEstadoInvalidoError, 'El envio ya ha sido entregado.'
  end
end
