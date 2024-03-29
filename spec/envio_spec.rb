require 'spec_helper'
require_relative '../modelos/envio'
require_relative '../modelos/vehiculos/moto'

describe 'envio' do
  let(:cliente) { Cliente.new('Juan', Direccion.new('Av Las Heras 1232', 'CP: 1018'), 8) }
  let(:cadete) { Cadete.new('Pedro', Moto.new, 8) }
  let(:tamanio) { Chico.new }

  describe 'valido?' do
    it 'Se crea exitosamente un envio al ingresar todos los datos correctamente' do
      envio = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', 'CP: 1018'), cliente, Clasico.new)

      expect(envio.valid?).to eq true
    end

    it 'Se crea exitosamente un envio al ingresarle un cadete' do
      envio = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', 'CP: 1018'), cliente, Clasico.new)
      envio.cadete = cadete

      expect(envio.valid?).to eq true
    end

    it 'Se obtiene correctamente el tiempo estimado del envio' do
      envio = Envio.new(tamanio, Direccion.new('Av Las Heras 1232', 'CP: 1018'), cliente, Clasico.new)
      envio.cadete = cadete

      expect(envio.tiempo_estimado >= 0).to eq true
    end
  end
end
