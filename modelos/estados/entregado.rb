require_relative './estado'

class Entregado < Estado
  ESTADO = 'entregado'.freeze

  def initialize
    super(ESTADO)
  end
end
