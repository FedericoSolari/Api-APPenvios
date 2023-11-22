class DomicilioInexistenteError < StandardError
  def initialize(message = 'El domicilio ingresado no existe')
    super(message)
  end
end
