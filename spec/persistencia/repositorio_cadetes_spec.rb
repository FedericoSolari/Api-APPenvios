require 'integration_helper'
require_relative '../../modelos/cadete'
require_relative '../../persistencia/repositorio_cadetes'

describe RepositorioCadetes do
  it 'deberia guardar y asignar id al cliente' do
    pedro = Cadete.new('Pedro', 'auto')
    described_class.new.save(pedro)
    expect(pedro.id).not_to be_nil
  end
end
