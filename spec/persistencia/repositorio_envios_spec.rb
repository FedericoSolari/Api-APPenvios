require 'integration_helper'
require 'byebug'
require_relative '../../modelos/envio'
require_relative '../../persistencia/repositorio_envios'

describe RepositorioEnvios do
  it 'deberia guardar y asignar id al envio' do
    envio = Envio.new('Av Las Heras 1232', 'CP: 1425', 8, 1)
    described_class.new.save(envio)
    expect(envio.id).not_to be_nil
  end

  it 'deberia encontrar envio sin cadete asignado' do
    repositorio = described_class.new
    repositorio.delete_all

    envio_asignado = Envio.new('Av Las Heras 1232', 'CP: 1425', 8)
    envio_asignado.asignar_cadete(1)
    repositorio.save(envio_asignado)

    envio_sin_asignar = Envio.new('Av Las Heras 1230', 'CP: 1420', 8)
    repositorio.save(envio_sin_asignar)

    envio_encontrado = repositorio.find_by_state('pendiente de asignacion')
    expect(envio_encontrado.id).to eq envio_sin_asignar.id
  end
end
