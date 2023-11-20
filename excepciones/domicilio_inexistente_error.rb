class DomicilioInexistenteError < StandardError
  def initialize(message = 'Error al conectar con la Api')
    super(message)
  end
end
