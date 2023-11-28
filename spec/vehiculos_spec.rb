require_relative '../modelos/vehiculos/auto'
require_relative '../modelos/vehiculos/moto'
require_relative '../modelos/vehiculos/bicicleta'
require_relative '../fabricas/fabrica_vehiculos'

describe 'Vehiculos' do
  describe 'Auto' do
    it 'Vehiculo auto creado correctamente' do
      vehiculo = Auto.new
      vehiculo_esperado = 'auto'
      expect(vehiculo.vehiculo).to eq vehiculo_esperado
    end
  end

  describe 'Moto' do
    it 'Vehiculo moto creado correctamente' do
      vehiculo = Moto.new
      vehiculo_esperado = 'moto'
      expect(vehiculo.vehiculo).to eq vehiculo_esperado
    end
  end

  describe 'Bicicleta' do
    it 'Vehiculo bicicleta creado correctamente' do
      vehiculo = Bicicleta.new
      vehiculo_esperado = 'bicicleta'
      expect(vehiculo.vehiculo).to eq vehiculo_esperado
    end
  end

  describe 'Fabrica de vehiculos' do
    it 'Fabrica crea correctamente un vehiculo auto' do
      fabrica = FabricaVehiculos.new
      vehiculo_a_crear = 'auto'
      vehiculo_creado = fabrica.crear_vehiculo(vehiculo_a_crear)

      expect(vehiculo_creado.vehiculo).to eq vehiculo_a_crear
    end

    it 'Fabrica crea correctamente un vehiculo moto' do
      fabrica = FabricaVehiculos.new
      vehiculo_a_crear = 'moto'
      vehiculo_creado = fabrica.crear_vehiculo(vehiculo_a_crear)

      expect(vehiculo_creado.vehiculo).to eq vehiculo_a_crear
    end
  end
end
