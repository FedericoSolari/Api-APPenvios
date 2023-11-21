require_relative '../modelos/tamanios/chico'
require_relative '../modelos/tamanios/mediano'
require_relative '../modelos/tamanios/grande'

class FabricaTamanios
  def crear_tamanio(tamanio)
    case tamanio
    when 'chico'
      Chico.new
    when 'mediano'
      Mediano.new
    when 'grande'
      Grande.new
    end
  end
end
