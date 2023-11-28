require_relative '../modelos/vehiculos/auto'

describe 'Vehiculos' do
  describe 'Auto' do
    it 'Vehiculo auto creado correctamente' do
      vehiculo = Auto.new
      vehiculo_esperado = 'auto'
      expect(vehiculo.vehiculo).to eq vehiculo_esperado
    end
  end
end
