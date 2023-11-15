require_relative '../modelos/ayudantes/parseador_solicitudes'

describe ParseadorSolicitudes do
  it 'Debería retornar los parámetros de registrar cliente' do
    mensaje = '/registrar Juan, Av Las Heras 1232, CP: 1425, 8'
    parametros_esperados = { comando: '/registrar', body: { nombre: 'Juan', direccion: 'Av Las Heras 1232',
                                                            codigo_postal: 'CP: 1425', id_cliente: '8' } }
    parametros_obtenidos = described_class.new.parsear(mensaje)
    expect(parametros_obtenidos[:comando]).to eq parametros_esperados[:comando]
    expect(parametros_obtenidos[:body][:nombre]).to eq parametros_esperados[:body][:nombre]
    expect(parametros_obtenidos[:body][:direccion]).to eq parametros_esperados[:body][:direccion]
    expect(parametros_obtenidos[:body][:codigo_postal]).to eq parametros_esperados[:body][:codigo_postal]
    expect(parametros_obtenidos[:body][:id_cliente]).to eq parametros_esperados[:body][:id_cliente]
  end

  it 'Debería retornar los parámetros de registrar cadete' do
    mensaje = '/registrar_cadete Juan, Moto, 8'
    parametros_esperados = { comando: '/registrar_cadete', body: { nombre: 'Juan', vehiculo: 'Moto',
                                                                   id_cadete: '8' } }
    parametros_obtenidos = described_class.new.parsear(mensaje)
    expect(parametros_obtenidos[:comando]).to eq parametros_esperados[:comando]
    expect(parametros_obtenidos[:body][:nombre]).to eq parametros_esperados[:body][:nombre]
    expect(parametros_obtenidos[:body][:vehiculo]).to eq parametros_esperados[:body][:vehiculo]
    expect(parametros_obtenidos[:body][:id_cadete]).to eq parametros_esperados[:body][:id_cadete]
  end
end
