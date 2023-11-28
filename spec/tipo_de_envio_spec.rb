require_relative '../modelos/tipo_de_envio/tipo_envio'
require_relative '../modelos/tipo_de_envio/clasico'
require_relative '../modelos/tipo_de_envio/express'
require_relative '../fabricas/fabrica_de_tipos'

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

  describe 'Fabrica de tipos de envio' do
    it 'Fabrica crea correctamente un tipo de envio clasico' do
      fabrica = FabricaTipoEnvios.new
      tipo_a_crear = 'clasico'
      tipo_creado = fabrica.crear_tipo_de_envio(tipo_a_crear)

      expect(tipo_creado.tipo).to eq tipo_a_crear
    end

    xit 'Fabrica crea correctamente un tipo de envio express' do
      fabrica = FabricaTipoEnvios.new
      tipo_a_crear = 'express'
      tipo_creado = fabrica.crear_tipo_de_envio(tipo_a_crear)

      expect(tipo_creado.tipo).to eq tipo_a_crear
    end
  end
end
