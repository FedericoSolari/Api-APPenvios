require 'spec_helper'
require_relative '../modelos/cadete'
require_relative '../modelos/vehiculos/moto'

describe 'cadete' do
  describe 'valido?' do
    it 'Se crea exitosamente un cadete al ingresar todos los datos correctamente' do
      cadete = Cadete.new('Pedro', Moto.new, 8)

      expect(cadete.valid?).to eq true
    end
  end
end
