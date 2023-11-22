class EnvioNoEncontradoError < StandardError
  def initialize(message = 'No se encontraron envios con el estado deseado')
    super(message)
  end
end
