require 'spec_helper'
require_relative '../modelos/estados/pendiente'
require_relative '../modelos/estados/en_proceso'
require_relative '../modelos/estados/entregado'
require_relative '../fabricas/fabrica_estados'

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

    it 'Estado pendiente no se encuentra entregado' do
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

    it 'Estado EnProceso no se encuentra entregado' do
      estado_envio = EnProceso.new

      expect(estado_envio.se_entrego?).to eq false
    end
  end

  describe 'Entregado' do
    it 'Estado Entregado se encuentra asignado a un cadete' do
      estado_envio = Entregado.new

      expect(estado_envio.cadete_asignado?).to eq true
    end

    it 'Estado Entregado fue retirado por el cadete' do
      estado_envio = Entregado.new

      expect(estado_envio.se_retiro?).to eq true
    end

    it 'Estado Entregado se encuentra entregado' do
      estado_envio = Entregado.new

      expect(estado_envio.se_entrego?).to eq true
    end
  end

  describe 'Fabrica de estados' do
    it 'Fabrica crea correctamente un estado Pendiente' do
      fabrica = FabricaEstados.new
      estado_a_crear = 'pendiente de asignacion'
      estado_creado = fabrica.crear_estado(estado_a_crear)

      expect(estado_creado.estado).to eq estado_a_crear
    end

    it 'Fabrica crea correctamente un estado EnProceso' do
      fabrica = FabricaEstados.new
      estado_a_crear = 'en proceso'
      estado_creado = fabrica.crear_estado(estado_a_crear)

      expect(estado_creado.estado).to eq estado_a_crear
    end

    it 'Fabrica crea correctamente un estado Entregado' do
      fabrica = FabricaEstados.new
      estado_a_crear = 'entregado'
      estado_creado = fabrica.crear_estado(estado_a_crear)

      expect(estado_creado.estado).to eq estado_a_crear
    end
  end
end
