require_relative './estado'

class Entregado < Estado
  ESTADO = 'entregado'.freeze

  def initialize
    super(ESTADO)
  end

  def cambiar_pendiente
    raise CambioEstadoInvalidoError, 'No se puede confirmar la entrega. El envío aún no tiene un cadete asignado.'
  end

  def cambiar_asignado
    raise CambioEstadoInvalidoError, 'No se puede confirmar la entrega. El envío no ha sido retirado.'
  end
end
