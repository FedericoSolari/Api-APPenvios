require 'spec_helper'
require_relative '../modelos/cadete'

describe 'cadete' do
  describe 'valido?' do
    it 'Se crea exitosamente un cadete al ingresar todos los datos correctamente' do
      cadete = Cadete.new('Pedro', 'moto')

      expect(cadete.valid?).to eq true
    end
  end
end
