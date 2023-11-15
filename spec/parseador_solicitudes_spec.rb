describe 'ParseadorSolicitudes' do
  xit 'Debería retornar 5 parámetros al registrar cliente' do
    mensaje = '/registrar Juan, Av Las Heras 1232, CP: 1425'
    parametros_esperados = 5
    expect(described_class.new.parsear(mensaje).length).to eq parametros_esperados
  end
end
