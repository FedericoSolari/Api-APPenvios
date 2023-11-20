require 'spec_helper'
require_relative '../modelos/envio'

describe 'envio' do
  let(:cliente) { Cliente.new('Juan', 'Cerrito 628', 'CP:1010', 8) }

  describe 'valido?' do
    it 'Se crea exitosamente un envio al ingresar todos los datos correctamente' do
      envio = Envio.new('Av Las Heras 1232', '1425', cliente)

      expect(envio.valid?).to eq true
    end

    it 'Se crea exitosamente un envio al ingresarle el id del cadete' do
      envio = Envio.new('Av Las Heras 1232', '1425', cliente, 1)

      expect(envio.valid?).to eq true
    end
  end
end
