require_relative '../modelos/vehiculos/auto'
require_relative '../modelos/vehiculos/moto'
require_relative '../modelos/vehiculos/bicicleta'
require_relative '../excepciones/vehiculo_incorrecto_error'

class FabricaVehiculos
  def crear_vehiculo(vehiculo)
    case vehiculo.downcase
    when 'auto'
      Auto.new
    when 'moto'
      Moto.new
    when 'bicicleta'
      Bicicleta.new
    else
      raise VehiculoIncorrectoError
    end
  end
end
