class CiudadIncorrectaError < StandardError
  def initialize(message = "La dirección que se proporcionó no se encuentra en #{ENV['CIUDAD']}")
    super(message)
  end
end
