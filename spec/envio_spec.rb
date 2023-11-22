require 'spec_helper'
require_relative '../modelos/envio'

describe 'envio' do
  let(:cliente) { Cliente.new('Juan', Direccion.new('Av Las Heras 1232', 'CP: 1018'), 8) }
  let(:cadete) { Cadete.new('Pedro', 'Moto', 8) }
  let(:tamanio) { Chico.new }

  describe 'valido?' do
    it 'Se crea exitosamente un envio al ingresar todos los datos correctamente' do
      envio = Envio.new(tamanio, 'Av Las Heras 1232', '1425', cliente)

      expect(envio.valid?).to eq true
    end

    it 'Se crea exitosamente un envio al ingresarle un cadete' do
      envio = Envio.new(tamanio, 'Av Las Heras 1232', '1425', cliente, cadete)

      expect(envio.valid?).to eq true
    end
  end
end
