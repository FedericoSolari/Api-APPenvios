require_relative '../modelos/vehiculos/auto'

class FabricaVehiculos
  def crear_vehiculo(vehiculo)
    case vehiculo.downcase
    when 'auto'
      Auto.new
    end
  end
end
