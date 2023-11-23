class UsuarioDuplicadoError < StandardError
  def initialize(message = 'Ya hay un usuario registrado con ese nombre')
    super(message)
  end
end
