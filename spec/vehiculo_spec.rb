describe 'Vehiculos' do
  describe 'Auto' do
    xit 'Vehiculo auto creado correctamente' do
      vehiculo = Auto.new
      vehiculo_esperado = 'auto'
      expect(vehiculo.vehiculo).to eq vehiculo_esperado
    end
  end
end
