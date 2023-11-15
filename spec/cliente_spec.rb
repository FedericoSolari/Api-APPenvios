require 'spec_helper'
require_relative '../modelos/cliente'

describe 'cliente' do
  describe 'valido?' do
    it 'Se crea exitosamente un cliente al ingresar todos los datos correctamente' do
      cliente = Cliente.new('Juan', 'Av Las Heras 1232', '1425', 8)

      expect(cliente.valid?).to eq true
    end
  end
end
