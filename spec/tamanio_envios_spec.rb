require_relative '../modelos/tamanios/chico'
require_relative '../modelos/tamanios/mediano'
require_relative '../modelos/tamanios/grande'

describe 'Tamaños' do
  # Por ahora solo se va a testear que devuelva el nombre bien, luego va a tener
  # mayor funcionalidad
  describe 'Chico' do
    it 'Envio chico creado correctamente' do
      tamanio = Chico.new
      tamanio_esperado = 'chico'
      expect(tamanio.tamanio).to eq tamanio_esperado
    end
  end

  describe 'Mediano' do
    it 'Envio mediano creado correctamente' do
      tamanio = Mediano.new
      tamanio_esperado = 'mediano'
      expect(tamanio.tamanio).to eq tamanio_esperado
    end
  end

  describe 'Grande' do
    it 'Envio grande creado correctamente' do
      tamanio = Grande.new
      tamanio_esperado = 'grande'
      expect(tamanio.tamanio).to eq tamanio_esperado
    end
  end
end
