class Vehiculo
  attr_accessor :vehiculo

  def initialize(vehiculo)
    @vehiculo = vehiculo
  end

  def tamanios_permitidos
    raise NotImplementedError, 'Debería ser implementado por una clase hija'
  end
end
