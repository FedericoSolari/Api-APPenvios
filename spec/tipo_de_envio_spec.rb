describe 'Tipo de envio' do
  describe 'Clasico' do
    xit 'Envio clasico creado correctamente' do
      tipo = Clasico.new
      tipo_esperado = 'clasico'
      expect(tipo.tipo).to eq tipo_esperado
    end
  end
end
