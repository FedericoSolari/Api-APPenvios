require 'spec_helper'
require_relative '../modelos/estados/pendiente'

describe 'Estados' do
  describe 'Pendiente' do
    it 'Estado pendiente no se encuentra asignado a un cadete' do
      estado_envio = Pendiente.new

      expect(estado_envio.cadete_asignado?).to eq false
    end

    it 'Estado pendiente no fue retirado por el cadete' do
      estado_envio = Pendiente.new

      expect(estado_envio.se_retiro?).to eq false
    end

    it 'Estado pendiente no fue entregado' do
      estado_envio = Pendiente.new

      expect(estado_envio.se_entrego?).to eq false
    end
  end
end
