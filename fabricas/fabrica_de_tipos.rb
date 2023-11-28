require_relative '../modelos/tipo_de_envio/clasico'
require_relative '../modelos/tipo_de_envio/express'

class FabricaTipoEnvios
  def crear_tipo_de_envio(tipo)
    case tipo.downcase
    when 'clasico'
      Clasico.new
    when 'express'
      Express.new
    end
  end
end
