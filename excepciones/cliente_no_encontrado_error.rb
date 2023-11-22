class ClienteNoEncontradoError < StandardError
  def initialize(message = 'No se encontró cliente con el id enviado')
    super(message)
  end
end
