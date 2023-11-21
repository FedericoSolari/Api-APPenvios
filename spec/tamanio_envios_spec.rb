require_relative '../modelos/tamanios/chico'
require_relative '../modelos/tamanios/mediano'
require_relative '../modelos/tamanios/grande'
require_relative '../fabricas/fabrica_tamanios'

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

  describe 'Fabrica de tamaños' do
    it 'Fabrica crea correctamente un tamaño chico' do
      fabrica = FabricaTamanios.new
      tamanio_a_crear = 'chico'
      tamanio_creado = fabrica.crear_tamanio(tamanio_a_crear)

      expect(tamanio_creado.tamanio).to eq tamanio_a_crear
    end

    it 'Fabrica crea correctamente un tamaño mediano' do
      fabrica = FabricaTamanios.new
      tamanio_a_crear = 'mediano'
      tamanio_creado = fabrica.crear_tamanio(tamanio_a_crear)

      expect(tamanio_creado.tamanio).to eq tamanio_a_crear
    end
  end
end
