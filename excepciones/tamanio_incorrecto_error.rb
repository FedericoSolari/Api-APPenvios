class TamanioIncorrectoError < StandardError
  def initialize(message = 'Tamaño indicado incorrecto, los tamaños validos son: Chico, Mediano o Grande')
    super(message)
  end
end
