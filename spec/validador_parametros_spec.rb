require_relative '../modelos/ayudantes/validador_parametros'
require_relative '../excepciones/parametros_invalidos_error'

describe ValidadorParametros do
  describe 'Registro cliente' do
    it 'Debería lanzar excepción de parametros invalidos cuando falta el nombre' do
      parametros_enviados = { direccion: 'Cerrito 628', codigo_postal: 'CP: 1010', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)
      expect { described_class.new.validar_registro_cliente(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end
  end
end
