require_relative '../modelos/tipo_de_envio/clasico'

class FabricaTipoEnvios
  def crear_tipo_de_envio(tipo)
    case tipo.downcase
    when 'clasico'
      Clasico.new
    end
  end
end
