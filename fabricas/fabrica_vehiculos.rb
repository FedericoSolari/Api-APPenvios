require_relative '../modelos/vehiculos/auto'
require_relative '../modelos/vehiculos/moto'

class FabricaVehiculos
  def crear_vehiculo(vehiculo)
    case vehiculo.downcase
    when 'auto'
      Auto.new
    when 'moto'
      Moto.new
    end
  end
end
