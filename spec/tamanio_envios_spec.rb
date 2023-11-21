require_relative '../modelos/tamanios/chico'

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
end
