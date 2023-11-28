require 'spec_helper'
require_relative '../modelos/estados/pendiente'
require_relative '../modelos/estados/asignado'
require_relative '../modelos/estados/en_camino'
require_relative '../modelos/estados/entregado'
require_relative '../fabricas/fabrica_estados'
require_relative '../excepciones/cambio_estado_invalido_error'

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

  describe 'Pendiente de asignación' do
    it 'Estado pendiente de asignación no puede cambiar a estado pendiente de asignación' do
      estado = Pendiente.new

      expect do
        estado.cambiar_pendiente
      end.to raise_error(
        CambioEstadoInvalidoError, 'El envio ya se encuentra en estado pendiente de asignación.'
      )
    end

    it 'Estado pendiente de asignación puede cambiar a estado asignado' do
      estado = Asignado.new

      expect(estado.cambiar_pendiente.estado).to eq estado.estado
    end

    it 'Estado pendiente de asignación no puede cambiar a estado en camino' do
      estado = EnCamino.new

      expect do
        estado.cambiar_pendiente
      end.to raise_error(
        CambioEstadoInvalidoError, 'No se puede confirmar el retiro. El envío aún no tiene un cadete asignado.'
      )
    end

    it 'Estado pendiente de asignación no puede cambiar a estado entregado' do
      estado = Entregado.new

      expect do
        estado.cambiar_pendiente
      end.to raise_error(
        CambioEstadoInvalidoError, 'No se puede confirmar la entrega. El envío aún no tiene un cadete asignado.'
      )
    end
  end

  describe 'Asignado' do
    it 'Estado asignado no puede cambiar a estado pendiente de asignación' do
      estado = Pendiente.new

      expect do
        estado.cambiar_asignado
      end.to raise_error(
        CambioEstadoInvalidoError, 'El envio ya se encuentra asignado.'
      )
    end

    it 'Estado asignado no puede cambiar a estado asignado' do
      estado = Asignado.new

      expect do
        estado.cambiar_asignado
      end.to raise_error(
        CambioEstadoInvalidoError, 'El envio ya se encuentra asignado.'
      )
    end

    it 'Estado asignado puede cambiar a estado en camino' do
      estado = EnCamino.new

      expect(estado.cambiar_asignado.estado).to eq estado.estado
    end

    it 'Estado asignado no puede cambiar a estado entregado' do
      estado = Entregado.new

      expect do
        estado.cambiar_asignado
      end.to raise_error(
        CambioEstadoInvalidoError, 'No se puede confirmar la entrega. El envío no ha sido retirado.'
      )
    end
  end
end
