require 'spec_helper'
require_relative '../modelos/envio'

describe 'envio' do
  describe 'valido?' do
    it 'Se crea exitosamente un envio al ingresar todos los datos correctamente' do
      envio = Envio.new('Av Las Heras 1232', '1425', 8)

      expect(envio.valid?).to eq true
    end
  end
end
