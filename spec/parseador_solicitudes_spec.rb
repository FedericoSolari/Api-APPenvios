require_relative '../modelos/ayudantes/parseador_solicitudes'

describe ParseadorSolicitudes do
  it 'Debería retornar 5 parámetros al registrar cliente' do
    mensaje = '/registrar Juan, Av Las Heras 1232, CP: 1425, 8'
    parametros_esperados = 5
    expect(described_class.new.parsear(mensaje)).to eq parametros_esperados
  end

  xit 'Debería retornar los parámetros de registrar cliente enviados' do
    mensaje = '/registrar Juan, Av Las Heras 1232, CP: 1425, 8'
    parametros_esperados = ['/registrar', 'Juan', 'Av Las Heras 1232', 'CP: 1425', 8]
    parametros_obtenidos = described_class.new.parsear(mensaje)
    expect(parametros_obtenidos[1]).to eq parametros_esperados[0]
    expect(parametros_obtenidos[2]).to eq parametros_esperados[1]
    expect(parametros_obtenidos[3]).to eq parametros_esperados[2]
    expect(parametros_obtenidos[4]).to eq parametros_esperados[3]
    expect(parametros_obtenidos[5]).to eq parametros_esperados[4]
  end
end
