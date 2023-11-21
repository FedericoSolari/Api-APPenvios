require 'spec_helper'
require_relative '../modelos/estados/pendiente'
require_relative '../modelos/estados/en_proceso'

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

  describe 'En Proceso' do
    it 'Estado EnProceso se encuentra asignado a un cadete' do
      estado_envio = EnProceso.new

      expect(estado_envio.cadete_asignado?).to eq true
    end

    it 'Estado EnProceso no fue retirado por el cadete' do
      estado_envio = EnProceso.new

      expect(estado_envio.se_retiro?).to eq false
    end

    it 'Estado EnProceso no fue entregado' do
      estado_envio = EnProceso.new

      expect(estado_envio.se_entrego?).to eq false
    end
  end
end
