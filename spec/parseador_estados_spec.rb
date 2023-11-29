require 'spec_helper'
require_relative '../ayudantes/parseador_estado'
require_relative '../modelos/vehiculos/moto'

describe 'ParseadorEstados' do
  let(:cliente) { Cliente.new('Juan', Direccion.new('Av Las Heras 1232', 'CP: 1018'), 8) }
  let(:cadete) { Cadete.new('Pedro', Moto.new, 8) }
  let(:tamanio) { Chico.new }

  it 'Devuelve mensaje "Tu envio (ID: 8) se encuentra pendiente de asignación" con estado pendiente de asignacion' do
    envio = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', 'CP: 1018'), cliente, Clasico.new, 8)
    envio.cadete = cadete

    mensaje_estado = ParseadorEstado.new.obtener_mensaje(envio).gsub(/[\n*_]/, '')

    expect(mensaje_estado).to eq 'Tu envio (ID: 8) se encuentra pendiente de asignación'
  end

  it 'Devuelve mensaje "Tu envio (ID: 8) fue asignado a Pedro, ya está en camino!" con estado asignado' do
    envio = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', 'CP: 1018'), cliente, Clasico.new, 8)
    envio.cadete = cadete
    envio.estado = Asignado.new
    mensaje_estado = ParseadorEstado.new.obtener_mensaje(envio).gsub(/[\n*_]/, '')

    expect(mensaje_estado).to eq 'Tu envio (ID: 8) fue asignado a Pedro, ya está en camino!'
  end

  # rubocop:disable Layout/LineLength
  it 'Devuelve mensaje "Tu envio (ID: 8) se encuentra en camino al domicilio Av Las Heras 1232, CP: 1018. Tiempo estimado: 10 minutos" con estado asignado' do
    envio = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', 'CP: 1018'), cliente, Clasico.new, 8)
    envio.cadete = cadete
    envio.estado = EnCamino.new
    mensaje_estado = ParseadorEstado.new.obtener_mensaje(envio).gsub(/[\n*_]/, '')

    expect(mensaje_estado).to eq 'Tu envio (ID: 8) se encuentra en camino al domicilio Av Las Heras 1232, CP: 1018. Tiempo estimado: 10 minutos'
  end
  # rubocop:enable Layout/LineLength

  it 'Devuelve mensaje "Ya entregamos tu envio (ID: 8)" con estado entregado' do
    envio = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', 'CP: 1018'), cliente, Clasico.new, 8)
    envio.cadete = cadete
    envio.estado = Entregado.new
    mensaje_estado = ParseadorEstado.new.obtener_mensaje(envio).gsub(/[\n*_]/, '')

    expect(mensaje_estado).to eq 'Ya entregamos tu envio (ID: 8)'
  end
end
