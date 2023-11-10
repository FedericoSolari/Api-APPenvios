require 'spec_helper'

describe 'cliente' do
  xit 'Se crea exitosamente un cliente al ingresar todos los datos correctamente' do
    cliente = Cliente.new('Juan', 'Av Las Heras 1232', 'CP: 1425')

    expect(cliente.valid?).to eq true
  end
end
