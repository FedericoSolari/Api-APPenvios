require_relative './tipo_envio'

class Clasico < TipoEnvio
  TIPO = 'clasico'.freeze
  def initialize
    super(TIPO)
  end
end
