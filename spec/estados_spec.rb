require 'spec_helper'

describe 'Estados' do
  describe 'Pendiente' do
    xit 'Estado pendiente no se encuentra asignado a un cadete' do
      estado_envio = Pendiente.new

      expect(estado_envio.cadete_asignado?).to eq false
    end
  end
end
