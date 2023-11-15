require 'integration_helper'
require_relative '../../modelos/envio'

describe RepositorioClientes do
  xit 'deberia guardar y asignar id al envio' do
    envio = Envio.new('Av Las Heras 1232', 'CP: 1425', 8)
    described_class.new.save(envio)
    expect(envio.id).not_to be_nil
  end
end
