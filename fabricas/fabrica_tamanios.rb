require_relative '../modelos/tamanios/chico'
require_relative '../modelos/tamanios/mediano'

class FabricaTamanios
  def crear_tamanio(tamanio)
    case tamanio
    when 'chico'
      Chico.new
    when 'mediano'
      Mediano.new
    end
  end
end
