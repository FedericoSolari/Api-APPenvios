require 'spec_helper'
require_relative '../modelos/cliente'
require_relative '../modelos/direccion'

describe 'cliente' do
  describe 'valido?' do
    it 'Se crea exitosamente un cliente al ingresar todos los datos correctamente' do
      direccion = Direccion.new('Av Las Heras 1232', 'CP: 1018')
      cliente = Cliente.new('Juan', direccion, 8)

      expect(cliente.valid?).to eq true
    end
  end
end
