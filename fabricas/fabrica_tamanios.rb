require_relative '../modelos/tamanios/chico'
require_relative '../modelos/tamanios/mediano'
require_relative '../modelos/tamanios/grande'
require_relative '../excepciones/tamanio_incorrecto_error'

class FabricaTamanios
  def crear_tamanio(tamanio)
    case tamanio.downcase
    when 'chico'
      Chico.new
    when 'mediano'
      Mediano.new
    when 'grande'
      Grande.new
    else
      raise TamanioIncorrectoError
    end
  end
end
