require_relative '../modelos/tipo_de_envio/clasico'
require_relative '../modelos/tipo_de_envio/express'

class FabricaTipoEnvios
  def crear_tipo_de_envio(tipo)
    case tipo.downcase
    when 'express'
      Express.new
    else
      Clasico.new
    end
  end
end
