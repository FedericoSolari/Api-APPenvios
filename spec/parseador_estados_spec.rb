require 'spec_helper'
require_relative '../modelos/ayudantes/parseador_estado'

describe 'ParseadorEstados' do
  describe 'Mensajes de estado' do
    it 'Devuelve mensaje "Tu envio (ID: 8) se encuentra pendiente de asignación" con estado pendiente de asignacion' do
      mensaje_estado = ParseadorEstado.new.obtener_mensaje(8, 'pendiente de asignacion')

      expect(mensaje_estado).to eq 'Tu envio (ID: 8) se encuentra pendiente de asignación'
    end

    it 'Devuelve mensaje "Tu envio (ID: 8) se encuentra en proceso de entrega" con estado en proceso' do
      mensaje_estado = ParseadorEstado.new.obtener_mensaje(8, 'en proceso')

      expect(mensaje_estado).to eq 'Tu envio (ID: 8) se encuentra en proceso de entrega'
    end
  end
end
