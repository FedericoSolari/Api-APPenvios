require 'spec_helper'

describe 'envio' do
  describe 'valido?' do
    xit 'Se crea exitosamente un envio al ingresar todos los datos correctamente' do
      envio = Envio.new('Av Las Heras 1232', 'CP: 1425', 8)

      expect(envio.valid?).to eq true
    end
  end
end
