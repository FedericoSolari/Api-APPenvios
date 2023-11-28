require_relative './estado'

class Entregado < Estado
  ESTADO = 'entregado'.freeze

  def initialize
    super(ESTADO)
  end

  def cambiar_a_estado(estado)
    estado.cambiar_entregado
  end

  def cambiar_pendiente
    raise CambioEstadoInvalidoError, 'No se puede confirmar la entrega. El envío aún no tiene un cadete asignado.'
  end

  def cambiar_asignado
    raise CambioEstadoInvalidoError, 'No se puede confirmar la entrega. El envío no ha sido retirado.'
  end

  def cambiar_en_camino
    self
  end

  def cambiar_entregado
    raise CambioEstadoInvalidoError, 'El envio ya ha sido entregado.'
  end
end
