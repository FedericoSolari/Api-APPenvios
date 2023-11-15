require 'spec_helper'
require_relative '../modelos/cliente'

describe 'ParseadorEstados' do
  describe 'Mensajes de estado' do
    xit 'Devuelve mensaje "Tu envio (ID: 8) se encuentra pendiente de asignación" con estado pendiente de asignacion' do
      mensaje_estado = ParseadorEstado.new.obtener_mensaje('pendiente')

      expect(mensaje_estado).to eq 'Tu envio (ID: 8) se encuentra pendiente de asignación'
    end
  end
end
