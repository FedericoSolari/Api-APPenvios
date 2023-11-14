require 'integration_helper'
require_relative '../../modelos/cadete'

describe 'RepositorioCadetes' do
  xit 'deberia guardar y asignar id al cliente' do
    pedro = Cadete.new('Pedro', 'auto')
    described_class.new.save(pedro)
    expect(pedro.id).not_to be_nil
  end
end
