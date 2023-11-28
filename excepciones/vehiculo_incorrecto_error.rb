class VehiculoIncorrectoError < StandardError
  def initialize(message = 'Vehiculo indicado incorrecto, los vehiculos validos son: Auto, Moto o Bicicleta')
    super(message)
  end
end
