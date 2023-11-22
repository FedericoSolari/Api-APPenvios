require_relative '../modelos/ayudantes/validador_parametros'
require_relative '../excepciones/parametros_invalidos_error'

describe ValidadorParametros do
  describe 'Registro cliente' do
    it 'Debería lanzar excepción de parametros invalidos cuando falta el nombre' do
      parametros_enviados = { direccion: 'Cerrito 628', codigo_postal: 'CP: 1010', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)
      expect { described_class.new.validar_registro_cliente(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end

    it 'Debería lanzar excepción de parametros invalidos cuando falta la direccion' do
      parametros_enviados = { nombre: 'Juan', codigo_postal: 'CP: 1010', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)
      expect { described_class.new.validar_registro_cliente(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end

    it 'Debería lanzar excepción de parametros invalidos cuando falta el código postal' do
      parametros_enviados = { nombre: 'Juan', direccion: 'Cerrito 628', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)
      expect { described_class.new.validar_registro_cliente(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end

    it 'Debería lanzar excepción de parametros invalidos cuando falta el id del cliente' do
      parametros_enviados = { nombre: 'Juan', direccion: 'Cerrito 628', codigo_postal: 'CP: 1010' }.to_json
      parametros = JSON.parse(parametros_enviados)
      expect { described_class.new.validar_registro_cliente(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end

    it 'Debería devolver true cuando estan todos los parametros correctamente' do
      parametros_enviados = { nombre: 'Juan', direccion: 'Cerrito 628', codigo_postal: 'CP: 1010', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)
      expect(described_class.new.validar_registro_cliente(parametros)).to eq true
    end
  end
end
