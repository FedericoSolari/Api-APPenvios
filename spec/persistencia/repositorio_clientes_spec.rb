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
end
