require_relative '../modelos/tamanios/chico'

class FabricaTamanios
  def crear_tamanio(tamanio)
    case tamanio
    when 'chico'
      Chico.new
    end
  end
end
