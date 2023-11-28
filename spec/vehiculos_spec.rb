require_relative '../modelos/vehiculos/auto'
require_relative '../modelos/vehiculos/moto'

describe 'Vehiculos' do
  describe 'Auto' do
    it 'Vehiculo auto creado correctamente' do
      vehiculo = Auto.new
      vehiculo_esperado = 'auto'
      expect(vehiculo.vehiculo).to eq vehiculo_esperado
    end

    it 'Vehiculo moto creado correctamente' do
      vehiculo = Moto.new
      vehiculo_esperado = 'moto'
      expect(vehiculo.vehiculo).to eq vehiculo_esperado
    end
  end
end
