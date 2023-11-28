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

  def cambiar_en_camino
    raise CambioEstadoInvalidoError, 'El envio ya se encuentra en camino a la dirección de entrega.'
  end

  def cambiar_entregado
    raise CambioEstadoInvalidoError, 'El envio ya ha sido entregado.'
  end
end
