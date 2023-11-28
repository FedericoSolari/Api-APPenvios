require_relative '../validadores/validador_parametros'
require_relative '../excepciones/parametros_invalidos_error'

describe ValidadorParametros do
  describe 'Registro cliente' do
    it 'Debería lanzar excepción de parametros invalidos cuando falta el nombre' do
      parametros_enviados = { direccion: 'Cerrito 628', codigo_postal: 'CP: 1010', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect { described_class.new.validar_registro_cliente(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end

    it 'Debería lanzar excepción de parametros invalidos cuando falta la direccion' do
      parametros_enviados = { nombre: 'juan', codigo_postal: 'CP: 1010', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect { described_class.new.validar_registro_cliente(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end

    it 'Debería lanzar excepción de parametros invalidos cuando falta el código postal' do
      parametros_enviados = { nombre: 'juan', direccion: 'Cerrito 628', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect { described_class.new.validar_registro_cliente(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end

    it 'Debería lanzar excepción de parametros invalidos cuando falta el id del cliente' do
      parametros_enviados = { nombre: 'juan', direccion: 'Cerrito 628', codigo_postal: 'CP: 1010' }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect { described_class.new.validar_registro_cliente(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end

    it 'Debería devolver true cuando estan todos los parametros correctamente' do
      parametros_enviados = { nombre: 'juan', direccion: 'Cerrito 628', codigo_postal: 'CP: 1010', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect(described_class.new.validar_registro_cliente(parametros)).to eq true
    end
  end

  describe 'Registro cadete' do
    it 'Debería lanzar excepción de parametros invalidos cuando falta el nombre' do
      parametros_enviados = { vehiculo: 'moto', id_cadete: 2 }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect do
        described_class.new.validar_registro_cadete(parametros)
      end.to raise_error(
        ParametrosInvalidosError,
        'Verifique haber ingresado los datos necesarios, ' \
          'el formato correcto es: \<Nombre\>, \<Vehículo\>'
      )
    end

    it 'Debería lanzar excepción de parametros invalidos cuando falta el vehículo' do
      parametros_enviados = { nombre: 'pedro', id_cadete: 2 }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect do
        described_class.new.validar_registro_cadete(parametros)
      end.to raise_error(
        ParametrosInvalidosError,
        'Verifique haber ingresado los datos necesarios, ' \
          'el formato correcto es: \<Nombre\>, \<Vehículo\>'
      )
    end

    it 'Debería lanzar excepción de parametros invalidos cuando falta el id del cadete' do
      parametros_enviados = { nombre: 'pedro', vehiculo: 'moto' }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect do
        described_class.new.validar_registro_cadete(parametros)
      end.to raise_error(
        ParametrosInvalidosError,
        'Verifique haber ingresado los datos necesarios, ' \
          'el formato correcto es: \<Nombre\>, \<Vehículo\>'
      )
    end

    it 'Debería devolver true cuando estan todos los parametros correctamente' do
      parametros_enviados = { nombre: 'juan', vehiculo: 'moto', id_cadete: 2 }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect(described_class.new.validar_registro_cadete(parametros)).to eq true
    end

    it 'Validador de vehiculos deberia devolver true cuando el vehiculo es Moto' do
      parametros_enviados = { vehiculo: 'moto' }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect(described_class.new.validar_vehiculo(parametros['vehiculo'])).to eq true
    end

    it 'Validador de vehiculos deberia devolver true cuando el vehiculo es Auto' do
      parametros_enviados = { vehiculo: 'auto' }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect(described_class.new.validar_vehiculo(parametros['vehiculo'])).to eq true
    end

    it 'Validador de vehiculos deberia devolver true cuando el vehiculo es Bicicleta' do
      parametros_enviados = { vehiculo: 'bicicleta' }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect(described_class.new.validar_vehiculo(parametros['vehiculo'])).to eq true
    end

    it 'Validador de vehiculos deberia devolver error cuando el vehiculo es Monopatin' do
      parametros_enviados = { vehiculo: 'monopatin' }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect do
        described_class.new.validar_vehiculo(parametros['vehiculo'])
      end.to raise_error(
        ParametrosInvalidosError,
        'Nuestra flota no acepta ese tipo de vehiculo, los vehiculos permitidos son *auto*, *moto* o *bicicleta*.'
      )
    end
  end

  describe 'Creación de envio' do
    xit 'Debería lanzar excepción de parametros invalidos cuando falta el tipo' do
      parametros_enviados = { tamanio: 'chico', direccion: 'Cerrito 628', codigo_postal: 'CP: 1010', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect { described_class.new.validar_creacion_envio(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Tamaño\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end

    it 'Debería lanzar excepción de parametros invalidos cuando falta el tamaño' do
      parametros_enviados = { tipo: 'clasico', direccion: 'Cerrito 628', codigo_postal: 'CP: 1010', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect { described_class.new.validar_creacion_envio(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Tamaño\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end

    it 'Debería lanzar excepción de parametros invalidos cuando falta la direccion' do
      parametros_enviados = { tipo: 'clasico', tamanio: 'chico', codigo_postal: 'CP: 1010', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect { described_class.new.validar_creacion_envio(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Tamaño\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end

    it 'Debería lanzar excepción de parametros invalidos cuando falta el código postal' do
      parametros_enviados = { tipo: 'clasico', tamanio: 'chico', direccion: 'Cerrito 628', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect { described_class.new.validar_creacion_envio(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Tamaño\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end

    it 'Debería lanzar excepción de parametros invalidos cuando falta el id del cliente' do
      parametros_enviados = { tipo: 'clasico', tamanio: 'chico', direccion: 'Cerrito 628', codigo_postal: 'CP: 1010' }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect { described_class.new.validar_creacion_envio(parametros) }.to raise_error(ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Tamaño\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
    end

    it 'Debería devolver true cuando estan todos los parametros correctamente' do
      parametros_enviados = { tamanio: 'chico', direccion: 'Cerrito 628', codigo_postal: 'CP: 1010', id_cliente: 8 }.to_json
      parametros = JSON.parse(parametros_enviados)

      expect(described_class.new.validar_creacion_envio(parametros)).to eq true
    end
  end
end
