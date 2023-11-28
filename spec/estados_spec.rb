require 'spec_helper'
require_relative '../modelos/estados/pendiente'
require_relative '../modelos/estados/asignado'
require_relative '../modelos/estados/en_camino'
require_relative '../modelos/estados/entregado'
require_relative '../fabricas/fabrica_estados'

describe 'Estados' do
  describe 'Fabrica de estados' do
    it 'Fabrica crea correctamente un estado Pendiente' do
      fabrica = FabricaEstados.new
      estado_a_crear = 'pendiente de asignacion'
      estado_creado = fabrica.crear_estado(estado_a_crear)

      expect(estado_creado.estado).to eq estado_a_crear
    end

    it 'Fabrica crea correctamente un estado Asignado' do
      fabrica = FabricaEstados.new
      estado_a_crear = 'asignado'
      estado_creado = fabrica.crear_estado(estado_a_crear)

      expect(estado_creado.estado).to eq estado_a_crear
    end

    it 'Fabrica crea correctamente un estado EnCamino' do
      fabrica = FabricaEstados.new
      estado_a_crear = 'en camino'
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

  describe 'Pendiente de asignacion' do
    xit 'Estado pendiente de asignacion puede cambiar a estado Asignado' do
      estado_inicial = Pendiente.new
      estado_final = Asignado.new

      expect(estado_inicial.cambiar_a_estado(estado_final).estado).to eq estado_final.estado
    end

    xit 'Estado pendiente de asignacion no puede cambiar a estado En camino' do
      estado_inicial = Pendiente.new
      estado_final = Asignado.new

      expect do
        estado_inicial.cambiar_a_estado(estado_final).estado
      end.to raise_error(
        CambioEstadoInvalidoError, 'El envio no se encuentra asignado.'
      )
    end

    xit 'Estado pendiente de asignacion no puede cambiar a estado Entregado' do
      estado_inicial = Pendiente.new
      estado_final = Asignado.new

      expect do
        estado_inicial.cambiar_a_estado(estado_final).estado
      end.to raise_error(
        CambioEstadoInvalidoError, 'El envio no se encuentra asignado.'
      )
    end
  end
end
