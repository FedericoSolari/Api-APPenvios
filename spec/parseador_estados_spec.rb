require 'spec_helper'
require_relative '../ayudantes/parseador_estado'

describe 'ParseadorEstados' do
  describe 'Mensajes de estado' do
    let(:cliente) { Cliente.new('Juan', Direccion.new('Av Las Heras 1232', 'CP: 1018'), 8) }
    let(:cadete) { Cadete.new('Pedro', 'Moto', 8) }
    let(:tamanio) { Chico.new }

    it 'Devuelve mensaje "Tu envio (ID: 8) se encuentra pendiente de asignación" con estado pendiente de asignacion' do
      envio = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', '1018'), cliente, 8)
      envio.cadete = cadete

      mensaje_estado = ParseadorEstado.new.obtener_mensaje(envio).gsub(/[\n*_]/, '')

      expect(mensaje_estado).to eq 'Tu envio (ID: 8) se encuentra pendiente de asignación'
    end

    it 'Devuelve mensaje "Tu envio (ID: 8) se encuentra en proceso de entrega" con estado en proceso' do
      envio = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', '1018'), cliente, 8)
      envio.cadete = cadete
      envio.estado = EnProceso.new
      mensaje_estado = ParseadorEstado.new.obtener_mensaje(envio).gsub(/[\n*_]/, '')

      expect(mensaje_estado).to eq 'Tu envio (ID: 8) se encuentra en proceso de entrega. Tiempo estimado: 2 minutos'
    end
  end
end
