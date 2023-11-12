require 'integration_helper'
require_relative '../../persistencia/repositorio_clientes'
require_relative '../../modelos/cliente'

describe RepositorioClientes do
  it 'deberia guardar y asignar id al cliente' do
    juan = Cliente.new('Juan', 'Av Las Heras 1232', 'CP: 1425')
    described_class.new.save(juan)
    expect(juan.id).not_to be_nil
  end
end
