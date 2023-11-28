class CambioEstadoInvalidoError < StandardError
  def initialize(message = 'Error al cambiar de estado')
    super(message)
  end
end
