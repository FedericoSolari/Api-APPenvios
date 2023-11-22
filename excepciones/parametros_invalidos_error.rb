class ParametrosInvalidosError < StandardError
  def initialize(message = 'Parámetros inválidos error')
    super(message)
  end
end
