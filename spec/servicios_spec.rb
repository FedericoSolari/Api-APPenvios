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

    it 'Se crea exitosamente un cadete al ingresar todos los datos correctamente' do
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
      ServicioUsuarios.agregar_cliente(parametros_cliente)

      parametros_envio = { 'tamanio' => 'chico', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
      envio = ServicioEnvio.agregar_envio(parametros_envio)

      expect(envio.valid?).to eq true
    end

    it 'Se crea exitosamente un envio al ingresar todos los datos correctamente' do
      parametros_cliente = { 'nombre' => 'juan', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
      ServicioUsuarios.agregar_cliente(parametros_cliente)

      parametros_envio = { 'tamanio' => 'chico', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
      envio = ServicioEnvio.agregar_envio(parametros_envio)

      parametros_cadete = { 'nombre' => 'fede', 'vehiculo' => 'moto', 'id_cadete' => 1 }
      ServicioUsuarios.agregar_cadete(parametros_cadete)

      parametros_envio = { 'id_cadete' => 1 }
      envio_asignado = ServicioEnvio.asignar_envio(parametros_envio)

      expect(envio.id).to eq envio_asignado.id
    end

    it 'Se recibe correctamente el estado de un envio existente' do
      parametros_cliente = { 'nombre' => 'juan', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
      ServicioUsuarios.agregar_cliente(parametros_cliente)

      parametros_envio = { 'tamanio' => 'chico', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
      envio = ServicioEnvio.agregar_envio(parametros_envio)

      parametros_envio = { 'id' => envio.id, 'id_cliente' => 8 }
      estado_envio = ServicioEnvio.consultar_estado(parametros_envio, parametros_envio['id_cliente'])

      expect(estado_envio).to eq "Tu envio (ID: *#{envio.id}*) se encuentra *pendiente de asignación*"
    end

    it 'Se modifica el estado correctamente de un envio existente' do
      parametros_cliente = { 'nombre' => 'juan', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
      ServicioUsuarios.agregar_cliente(parametros_cliente)

      parametros_envio = { 'tamanio' => 'chico', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
      envio = ServicioEnvio.agregar_envio(parametros_envio)

      envio_actualizado = ServicioEnvio.actualizar_estado(envio.id, 'asignado')

      expect(envio_actualizado.estado.estado).to eq 'asignado'
    end

    it 'Se obtiene el historial de envios del cliente' do
      parametros_cliente = { 'nombre' => 'juan', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
      ServicioUsuarios.agregar_cliente(parametros_cliente)

      # creo dos envios
      parametros_envio1 = { 'tamanio' => 'chico', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
      ServicioEnvio.agregar_envio(parametros_envio1)

      parametros_envio2 = { 'tamanio' => 'grande', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
      ServicioEnvio.agregar_envio(parametros_envio2)

      historial = ServicioEnvio.historial_de_envios(parametros_envio1['id_cliente'])

      expect(historial.size).to eq 2
    end
  end
end
