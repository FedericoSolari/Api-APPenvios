require 'spec_helper'
require_relative '../modelos/cadete'
require_relative '../modelos/vehiculos/moto'
require_relative '../modelos/vehiculos/auto'
require_relative '../modelos/vehiculos/bicicleta'

describe 'cadete' do
  describe 'valido?' do
    it 'Se crea exitosamente un cadete al ingresar todos los datos correctamente' do
      cadete = Cadete.new('Pedro', Moto.new, 8)

      expect(cadete.valid?).to eq true
    end
  end

  describe 'Envios que puede aceptar el cadete' do
    xit 'Cadete con moto retorna los envios que puede aceptar' do
      cadete = Cadete.new('Pedro', Moto.new, 8)
      tamanios_esperado = %w[chico mediano]
      expect(cadete.tamanios_aceptados).to eq tamanios_esperado
    end

    xit 'Cadete con auto retorna los envios que puede aceptar' do
      cadete = Cadete.new('Pedro', Auto.new, 8)
      tamanios_esperado = %w[chico mediano grande]
      expect(cadete.tamanios_aceptados).to eq tamanios_esperado
    end

    xit 'Cadete con bicicleta retorna los envios que puede aceptar' do
      cadete = Cadete.new('Pedro', Bicicleta.new, 8)
      tamanios_esperado = %w[chico]
      expect(cadete.tamanios_aceptados).to eq tamanios_esperado
    end
  end
end
