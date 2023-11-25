require 'integration_helper'
require_relative '../../persistencia/repositorio_clientes'
require_relative '../../modelos/cliente'

describe RepositorioClientes do
  it 'deberia guardar y asignar id al cliente' do
    juan = Cliente.new('Juan', Direccion.new('Av Las Heras 1232', 'CP: 1018'), 8)
    described_class.new.save(juan)
    expect(juan.id).not_to be_nil
  end

  it 'deberia encontrar el registro segun el id del cliente' do
    juan = Cliente.new('Juan', Direccion.new('Av Las Heras 1232', 'CP: 1018'), 8)
    repositorio = described_class.new
    repositorio.save(juan)
    expect(repositorio.find_by_id(juan.id_cliente)).not_to be_nil
  end

  it 'debería encontrar el registro según el nombre del cliente' do
    pedro = Cliente.new('Pedro', Direccion.new('Av Las Heras 1232', 'CP: 1018'), 8)
    repositorio = described_class.new
    repositorio.save(pedro)
    expect(repositorio.find_by_name(pedro.nombre)).not_to be_nil
  end

  xit 'debería encontrar el ultimo registro con el id del cliente' do
    # creo dos usuarios con el mismo id_cliente
    ladislao = Cliente.new('ladislao', Direccion.new('Av Las Heras 1232', 'CP: 1018'), 8)
    ricardo = Cliente.new('ricardo', Direccion.new('Av Las Heras 1232', 'CP: 1018'), 8)
    repositorio = described_class.new
    repositorio.save(ladislao)
    repositorio.save(ricardo)
    cliente_encontrado = repositorio.find_last_created_with_id(ricardo.id_cliente)
    expect(cliente_encontrado.nombre).to eq ricardo.nombre
  end
end
