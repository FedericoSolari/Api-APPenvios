require_relative '../modelos/ayudantes/parseador_solicitudes'

describe ParseadorSolicitudes do
  it 'Debería retornar /registrar en el comando' do
    mensaje = '/registrar Juan, Av Las Heras 1232, CP: 1425'
    parametros_esperados = { comando: '/registrar', body: { nombre: 'Juan', direccion: 'Av Las Heras 1232',
                                                            codigo_postal: 'CP: 1425' } }
    parametros_obtenidos = described_class.new.parsear(mensaje)
    expect(parametros_obtenidos[:comando]).to eq parametros_esperados[:comando]
  end

  it 'Debería retornar Juan en el nombre del cliente' do
    mensaje = '/registrar Juan, Av Las Heras 1232, CP: 1425'
    parametros_esperados = { comando: '/registrar', body: { nombre: 'Juan', direccion: 'Av Las Heras 1232',
                                                            codigo_postal: 'CP: 1425' } }
    parametros_obtenidos = described_class.new.parsear(mensaje)
    expect(parametros_obtenidos[:body][:nombre]).to eq parametros_esperados[:body][:nombre]
  end

  it 'Debería retornar Av Las Heras 1232 en la direccion del cliente' do
    mensaje = '/registrar Juan, Av Las Heras 1232, CP: 1425'
    parametros_esperados = { comando: '/registrar', body: { nombre: 'Juan', direccion: 'Av Las Heras 1232',
                                                            codigo_postal: 'CP: 1425' } }
    parametros_obtenidos = described_class.new.parsear(mensaje)
    expect(parametros_obtenidos[:body][:direccion]).to eq parametros_esperados[:body][:direccion]
  end

  it 'Debería retornar CP:1425 en el codigo postal del cliente' do
    mensaje = '/registrar Juan, Av Las Heras 1232, CP: 1425'
    parametros_esperados = { comando: '/registrar', body: { nombre: 'Juan', direccion: 'Av Las Heras 1232',
                                                            codigo_postal: 'CP: 1425' } }
    parametros_obtenidos = described_class.new.parsear(mensaje)
    expect(parametros_obtenidos[:body][:codigo_postal]).to eq parametros_esperados[:body][:codigo_postal]
  end

  it 'Debería retornar /registrar-cadete en el comando' do
    mensaje = '/registrar-cadete Juan, Moto'
    parametros_esperados = { comando: '/registrar_cadete', body: { nombre: 'Juan', vehiculo: 'Moto' } }
    parametros_obtenidos = described_class.new.parsear(mensaje)
    expect(parametros_obtenidos[:comando]).to eq parametros_esperados[:comando]
  end

  it 'Debería retornar Juan en el nombre del cadete' do
    mensaje = '/registrar-cadete Juan, Moto'
    parametros_esperados = { comando: '/registrar_cadete', body: { nombre: 'Juan', vehiculo: 'Moto' } }
    parametros_obtenidos = described_class.new.parsear(mensaje)
    expect(parametros_obtenidos[:body][:nombre]).to eq parametros_esperados[:body][:nombre]
  end

  it 'Debería retornar Moto en el vehiculo del cadete' do
    mensaje = '/registrar-cadete Juan, Moto'
    parametros_esperados = { comando: '/registrar_cadete', body: { nombre: 'Juan', vehiculo: 'Moto' } }
    parametros_obtenidos = described_class.new.parsear(mensaje)
    expect(parametros_obtenidos[:body][:vehiculo]).to eq parametros_esperados[:body][:vehiculo]
  end
end
