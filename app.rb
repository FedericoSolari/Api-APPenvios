require 'sinatra'
require 'sequel'
require 'sinatra/custom_logger'
require_relative './config/configuration'
require_relative './modelos/ayudantes/parseador_estado'
require_relative './excepciones/ciudad_incorrecta_error'
require_relative './excepciones/domicilio_inexistente_error'
require_relative './excepciones/envio_no_encontrado_error'
require_relative './fabricas/fabrica_tamanios'
require_relative './modelos/ayudantes/validador_parametros'
require_relative './lib/version'
Dir[File.join(__dir__, 'dominio', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'persistencia', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'modelos', '*.rb')].each { |file| require file }
require_relative './servicios/servicio_cliente'
require_relative './servicios/servicio_envio'

customer_logger = Configuration.logger
set :logger, customer_logger
DB = Configuration.db
DB.loggers << customer_logger

get '/version' do
  { version: Version.current }.to_json
end

post '/reset' do
  RepositorioEnvios.new.delete_all
  RepositorioClientes.new.delete_all
  RepositorioCadetes.new.delete_all
end

post '/registrar' do
  @body ||= request.body.read
  parametros_cliente = JSON.parse(@body)
  customer_logger.info("INFO: Petición POST recibida en /registrar con cuerpo: #{@body}")
  begin
    if ValidadorParametros.new.validar_registro_cliente(parametros_cliente)
      cliente = ServicioCliente.agregar_cliente(parametros_cliente)
      customer_logger.info("Cliente registrado exitosamente: #{cliente.nombre}")
      handle_response(201, "Bienvenid@ *#{cliente.nombre}*. \nLas coordenadas de tu domicilio son: " \
        "\nLat: _#{cliente.direccion.latitud}_ \nLng: _#{cliente.direccion.longitud}_")
    end
  rescue CiudadIncorrectaError
    handle_response(400, "La dirección que se proporcionó no se encuentra en #{ENV['CIUDAD']}")
  rescue DomicilioInexistenteError
    handle_response(400, 'El domicilio ingresado no existe')
  rescue ParametrosInvalidosError
    handle_response(400, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
  rescue StandardError => e
    customer_logger.error('Error inesperado', e.message)
    handle_response(500, 'Error interno del servidor')
  end
end

post '/registrar_cadete' do
  @body ||= request.body.read
  parametros_cadete = JSON.parse(@body)

  begin
    if ValidadorParametros.new.validar_registro_cadete(parametros_cadete)
      cadete = Cadete.new(parametros_cadete['nombre'], parametros_cadete['vehiculo'], parametros_cadete['id_cadete'])
      RepositorioCadetes.new.save(cadete)
      handle_response(201, "Bienvenid@ a la flota *#{cadete.nombre}*")
    end
  rescue ParametrosInvalidosError
    handle_response(400,
                    'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Vehículo\>')
  rescue StandardError => e
    customer_logger.error('Error inesperado', e.message)
    handle_response(500, 'Error interno del servidor')
  end
end

post '/envios' do
  @body ||= request.body.read
  parametros_envio = JSON.parse(@body)
  customer_logger.info("INFO: Petición POST recibida en /envios con cuerpo: #{@body}")
  begin
    if ValidadorParametros.new.validar_creacion_envio(parametros_envio)
      envio = ServicioEnvio.agregar_envio(parametros_envio)
      customer_logger.info("INFO: Envio creado exitosamente: #{envio.id}")
      handle_response(201, "Se registró tu envio con el ID: *#{envio.id}*. " \
        "\nLas coordenadas del domicilio de entrega son: "\
        "\nLat: _#{envio.direccion.latitud}_ \nLng: _#{envio.direccion.longitud}_")
    end
  rescue CiudadIncorrectaError
    handle_response(400, "La dirección que se proporcionó no se encuentra en #{ENV['CIUDAD']}")
  rescue DomicilioInexistenteError
    handle_response(400, 'El domicilio ingresado no existe')
  rescue TamanioIncorrectoError
    handle_response(400, 'Tamaño indicado incorrecto, los tamaños validos son: Chico, Mediano o Grande')
  rescue ParametrosInvalidosError
    handle_response(400, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Tamaño\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
  rescue StandardError => e
    customer_logger.error('Error inesperado', e.message)
    handle_response(500, 'Error interno del servidor')
  end
end

get '/envios/:id' do
  customer_logger.info("INFO: Petición get recibida en /envios/id con id: #{params['id']}")
  envio = RepositorioEnvios.new.find(params['id'])
  texto = ParseadorEstado.new.obtener_mensaje(envio)
  customer_logger.info("INFO: Envio id:#{params['id']} con estado: #{envio.estado.estado}")
  handle_response(200, texto)
rescue StandardError => e
  customer_logger.error('Error inesperado', e.message)
  handle_response(500, 'Error interno del servidor')
end

put '/envios/asignar' do
  @body = request.body.read
  parametros_envio = JSON.parse(@body)

  customer_logger.info("INFO: Petición put recibida en /envios/asignar con cuerpo: #{@body}")

  envio = RepositorioEnvios.new.find_by_state('pendiente de asignacion')
  cadete = RepositorioCadetes.new.find_by_id(parametros_envio['id_cadete'])
  envio.asignar_cadete(cadete)
  envio.con_estado(FabricaEstados.new.crear_estado('en proceso'))

  customer_logger.info("INFO: Envio id:#{params['id']} asignado a cadete con id:#{cadete.id_cadete}")

  RepositorioEnvios.new.save(envio)

  handle_response(200, "Te asignamos el siguiente envio con ID *#{envio.id}*. \nRetirar el envio en *_#{envio.cliente.direccion.direccion}, #{envio.cliente.direccion.codigo_postal}_*. \nEntregar el envio en *_#{envio.direccion.direccion}, #{envio.direccion.codigo_postal}_*")
rescue EnvioNoEncontradoError
  handle_response(400, 'No hay envios disponibles')
rescue StandardError => e
  customer_logger.error('Error inesperado', e.message)
  handle_response(500, 'Error interno del servidor')
end

put '/envios/:id' do
  @body = request.body.read
  parametros_envio = JSON.parse(@body)

  customer_logger.info("INFO: Petición put recibida en /envios/:id con cuerpo: #{@body}")

  envio = RepositorioEnvios.new.find(params['id'])
  envio.con_estado(FabricaEstados.new.crear_estado(parametros_envio['estado']))

  customer_logger.info("INFO: Envio #{envio.id} se cambio a estado : #{envio.estado.estado}")

  RepositorioEnvios.new.save(envio)

  status 201
  { text: 'Gracias por entregar el envio!', cliente: envio.cliente.id_cliente,
    text_to_client: ParseadorEstado.new.obtener_mensaje(envio) }.to_json
rescue StandardError => e
  customer_logger.error('Error inesperado', e.message)
  handle_response(500, 'Error interno del servidor')
end

def handle_response(status_code, message)
  status status_code
  { text: message }.to_json
end
