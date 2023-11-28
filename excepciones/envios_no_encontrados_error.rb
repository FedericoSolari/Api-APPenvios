class EnviosNoEncontradosError < StandardError
  def initialize(message = 'No se encontraron envios realizados')
    super(message)
  end
end
