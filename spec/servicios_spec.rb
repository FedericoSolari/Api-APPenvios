require 'spec_helper'
require_relative '../servicios/servicio_usuarios'
require_relative '../servicios/servicio_direccion'
require_relative '../servicios/servicio_envio'

describe 'Servicios' do
  describe 'ServicioUsuarios' do
    it 'Se crea exitosamente un cliente al ingresar todos los datos correctamente' do
      parametros_cliente = { 'nombre' => 'juan', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
      cliente = ServicioUsuarios.agregar_cliente(parametros_cliente)

      expect(cliente.valid?).to eq true
    end

    xit 'Se crea exitosamente un cadete al ingresar todos los datos correctamente' do
      parametros_cadete = { 'nombre' => 'juan', 'vehiculo' => 'moto', 'id_cadete' => 8 }
      cadete = ServicioUsuarios.agregar_cadete(parametros_cadete)
      RepositorioCadetes.new.save(cadete)

      expect(cadete.valid?).to eq true
    end
  end

  describe 'ServicioDireccion' do
    it 'Se crea exitosamente una direccion al ingresar todos los datos correctamente' do
      parametros_direccion = { 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018' }
      direccion = ServicioDireccion.obtener_direccion(parametros_direccion['direccion'], parametros_direccion['codigo_postal'])

      expect(direccion.valid?).to eq true
    end
  end

  describe 'ServicioEnvio' do
    it 'Se crea exitosamente un envio al ingresar todos los datos correctamente' do
      parametros_cliente = { 'nombre' => 'juan', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
      cliente = ServicioUsuarios.agregar_cliente(parametros_cliente)
      RepositorioClientes.new.save(cliente)
      parametros_envio = { 'tamanio' => 'chico', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
      envio = ServicioEnvio.agregar_envio(parametros_envio)

      expect(envio.valid?).to eq true
    end
  end
end
