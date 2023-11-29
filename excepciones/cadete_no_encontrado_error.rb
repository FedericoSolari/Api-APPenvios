class CadeteNoEncontradoError < StandardError
  def initialize(message = 'No se encontró cadete con el id enviado')
    super(message)
  end
end
