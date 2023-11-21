require 'integration_helper'
require_relative '../../modelos/envio'
require_relative '../../persistencia/repositorio_envios'
require_relative '../../persistencia/repositorio_clientes'

describe RepositorioEnvios do
  let(:cliente) { Cliente.new('Juan', 'Cerrito 628', 'CP:1010', 8) }
  let(:cadete) { Cadete.new('Pedro', 'Moto', 8) }
  let(:tamanio) { Chico.new }

  it 'deberia guardar y asignar id al envio' do
    RepositorioClientes.new.save(cliente)
    RepositorioCadetes.new.save(cadete)
    envio = Envio.new(tamanio, 'Av Las Heras 1232', 'CP: 1425', cliente)
    envio.asignar_cadete(cadete)
    described_class.new.save(envio)
    expect(envio.id).not_to be_nil
  end

  it 'deberia encontrar envio sin cadete asignado' do
    RepositorioClientes.new.save(cliente)
    RepositorioCadetes.new.save(cadete)

    repositorio = described_class.new
    repositorio.delete_all

    envio_asignado = Envio.new(tamanio, 'Av Las Heras 1232', 'CP: 1425', cliente)
    envio_asignado.asignar_cadete(cadete)
    envio_asignado.con_estado(FabricaEstados.new.crear_estado('en proceso'))
    repositorio.save(envio_asignado)

    envio_sin_asignar = Envio.new(tamanio, 'Av Las Heras 1230', 'CP: 1420', cliente)
    repositorio.save(envio_sin_asignar)

    envio_encontrado = repositorio.find_by_state('pendiente de asignacion')
    expect(envio_encontrado.id).to eq envio_sin_asignar.id
  end
end
