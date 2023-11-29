require 'integration_helper'
require_relative '../../modelos/envio'
require_relative '../../persistencia/repositorio_envios'
require_relative '../../persistencia/repositorio_clientes'
require_relative '../../excepciones/envio_no_encontrado_error'
require_relative '../../modelos/vehiculos/moto'

describe RepositorioEnvios do
  let(:cliente) { Cliente.new('Juan', Direccion.new('Cerrito 628', 'CP:1010'), 8) }
  let(:cadete) { Cadete.new('Pedro', Moto.new, 8) }
  let(:tamanio) { Chico.new }

  it 'deberia guardar y asignar id al envio' do
    RepositorioClientes.new.save(cliente)
    RepositorioCadetes.new.save(cadete)
    envio = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', '1425'), cliente)
    envio.cadete = cadete
    described_class.new.save(envio)
    expect(envio.id).not_to be_nil
  end

  it 'deberia encontrar envio sin cadete asignado' do
    RepositorioClientes.new.save(cliente)
    RepositorioCadetes.new.save(cadete)

    repositorio = described_class.new
    repositorio.delete_all

    envio_asignado = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', '1425'), cliente)
    envio_asignado.cadete = cadete
    envio_asignado.estado = FabricaEstados.new.crear_estado('asignado')
    repositorio.save(envio_asignado)

    envio_sin_asignar = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', '1425'), cliente)
    repositorio.save(envio_sin_asignar)

    envio_encontrado = repositorio.find_by_state('pendiente de asignacion')
    expect(envio_encontrado.id).to eq envio_sin_asignar.id
  end

  it 'Salta excepcion cuando se busca por ID un envio que no existe' do
    repositorio = described_class.new
    repositorio.delete_all

    expect { repositorio.find(1) }.to raise_error(EnvioNoEncontradoError)
  end

  it 'deberia encontrar todos los envios de un cliente' do
    RepositorioClientes.new.save(cliente)
    RepositorioCadetes.new.save(cadete)

    repositorio = described_class.new
    repositorio.delete_all

    envio1 = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', '1425'), cliente)
    repositorio.save(envio1)
    envio2 = Envio.new(Grande.new, Direccion.new('moreno 1248', '1088'), cliente)
    repositorio.save(envio2)

    historial = repositorio.client_record(cliente.nombre)
    expect(historial.size).to eq 2
  end

  it 'Se obtiene envio chico sin asignar correctamente' do
    RepositorioClientes.new.save(cliente)
    RepositorioCadetes.new.save(cadete)

    repositorio = described_class.new
    repositorio.delete_all

    envio = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', '1425'), cliente)
    repositorio.save(envio)

    envios = repositorio.find_by_state_and_size('pendiente de asignacion', ['chico'])
    expect(['chico']).to include(envios.tamanio.tamanio)
  end

  it 'Se obtiene envio chico o mediano sin asignar correctamente' do
    RepositorioClientes.new.save(cliente)
    RepositorioCadetes.new.save(cadete)

    repositorio = described_class.new
    repositorio.delete_all

    envio = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', '1425'), cliente)
    repositorio.save(envio)
    envio2 = Envio.new(Mediano.new, Direccion.new('Av Las Heras 1232', '1425'), cliente)
    repositorio.save(envio2)

    envios = repositorio.find_by_state_and_size('pendiente de asignacion', %w[chico mediano])
    expect(%w[chico mediano]).to include(envios.tamanio.tamanio)
  end

  it 'Se obtiene envio grande o mediano sin asignar correctamente' do
    RepositorioClientes.new.save(cliente)
    RepositorioCadetes.new.save(cadete)

    repositorio = described_class.new
    repositorio.delete_all

    envio = Envio.new(Grande.new, Direccion.new('Av Las Heras 1232', '1425'), cliente)
    repositorio.save(envio)
    envio2 = Envio.new(Mediano.new, Direccion.new('Av Las Heras 1232', '1425'), cliente)
    repositorio.save(envio2)

    envios = repositorio.find_by_state_and_size('pendiente de asignacion', %w[grande mediano])
    expect(%w[grande mediano]).to include(envios.tamanio.tamanio)
  end
end
