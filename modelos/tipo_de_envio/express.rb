require_relative './tipo_envio'

class Express < TipoEnvio
  TIPO = 'express'.freeze
  def initialize
    super(TIPO)
  end
end
