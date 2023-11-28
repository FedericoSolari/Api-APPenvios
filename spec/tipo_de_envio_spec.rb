require_relative '../modelos/tipo_de_envio/tipo_envio'
require_relative '../modelos/tipo_de_envio/clasico'
require_relative '../modelos/tipo_de_envio/express'

describe 'Tipo de envio' do
  describe 'Clasico' do
    it 'Envio clasico creado correctamente' do
      tipo = Clasico.new
      tipo_esperado = 'clasico'
      expect(tipo.tipo).to eq tipo_esperado
    end
  end

  describe 'Express' do
    it 'Envio express creado correctamente' do
      tipo = Express.new
      tipo_esperado = 'express'
      expect(tipo.tipo).to eq tipo_esperado
    end
  end
end
