require 'sinatra'
require 'sequel'
require 'sinatra/custom_logger'
require_relative './ayudantes/parseador_estado'
require_relative './validadores/validador_parametros'
require_relative './config/configuration'
require_relative './excepciones/ciudad_incorrecta_error'
require_relative './excepciones/domicilio_inexistente_error'
require_relative './excepciones/envio_no_encontrado_error'
require_relative './excepciones/cliente_no_encontrado_error'
require_relative './excepciones/usuario_duplicado_error'
require_relative './excepciones/envios_no_encontrados_error'
require_relative './excepciones/cambio_estado_invalido_error'
require_relative './excepciones/cadete_no_encontrado_error'
require_relative './fabricas/fabrica_tamanios'
require_relative './lib/version'
Dir[File.join(__dir__, 'dominio', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'persistencia', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'modelos', '*.rb')].each { |file| require file }
require_relative './servicios/servicio_usuarios'
require_relative './servicios/servicio_envio'

customer_logger = Configuration.logger
set :logger, customer_logger
DB = Configuration.db
DB.loggers << customer_logger

get '/version' do
  { version: Version.current }.to_json
end

post '/reset' do
  if ENV['APP_ENV'] == 'test'
    RepositorioEnvios.new.delete_all
    RepositorioClientes.new.delete_all
    RepositorioCadetes.new.delete_all
    RepositorioDirecciones.new.delete_all
  else
    handle_response(401, 'No estas autorizado para realizar esta accion')
  end
end

post '/clientes' do
  @body ||= request.body.read
  parametros_cliente = JSON.parse(@body)
  customer_logger.info("INFO: Petición POST recibida en /registrar con cuerpo: #{@body}")
  begin
    if ValidadorParametros.new.validar_registro_cliente(parametros_cliente)
      cliente = ServicioUsuarios.agregar_cliente(parametros_cliente)
      customer_logger.info("Cliente registrado exitosamente: #{cliente.nombre.capitalize}")
      handle_response(201, "Bienvenid@ *#{cliente.nombre.capitalize}*. \nLas coordenadas de tu domicilio son: " \
      "\nLat: _#{cliente.direccion.latitud}_ \nLng: _#{cliente.direccion.longitud}_")
    end
  rescue UsuarioDuplicadoError
    handle_response(400, 'Ya hay un usuario registrado con ese nombre')
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

post '/cadetes' do
  @body ||= request.body.read
  parametros_cadete = JSON.parse(@body)

  begin
    if ValidadorParametros.new.validar_registro_cadete(parametros_cadete)
      cadete = ServicioUsuarios.agregar_cadete(parametros_cadete)
      handle_response(201, "Bienvenid@ a la flota *#{cadete.nombre.capitalize}*")
    end
  rescue UsuarioDuplicadoError
    handle_response(400, 'Ya hay un usuario registrado con ese nombre')
  rescue ParametrosInvalidosError => e
    handle_response(400, e.message)
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
  rescue ClienteNoEncontradoError
    handle_response(400, 'Para poder realizar un envio el usuario debe estar registrado')
  rescue CiudadIncorrectaError
    handle_response(400, "La dirección que se proporcionó no se encuentra en #{ENV['CIUDAD']}")
  rescue DomicilioInexistenteError
    handle_response(400, 'El domicilio ingresado no existe')
  rescue TamanioIncorrectoError
    handle_response(400, 'Tamaño indicado incorrecto, los tamaños validos son: Chico, Mediano o Grande')
  rescue ParametrosInvalidosError
    handle_response(400, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Tipo\>, \<Tamaño\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>')
  rescue StandardError => e
    customer_logger.error('Error inesperado', e.message)
    handle_response(500, 'Error interno del servidor')
  end
end

post '/envios/:id' do
  @body ||= request.body.read
  parametros_envio = JSON.parse(@body)
  customer_logger.info("INFO: Petición POST recibida en /envios/id con id: #{params['id']} y cuerpo: #{@body}")
  estado = ServicioEnvio.consultar_estado(params, parametros_envio['id_cliente'])
  customer_logger.info("INFO: Respuesta del estado de envio con id:#{params['id']}")
  handle_response(200, estado)
rescue EnvioNoEncontradoError
  handle_response(400, "No se encontró un envio con ID #{params['id']}")
rescue ParametrosInvalidosError => e
  handle_response(500, e.message)
rescue StandardError => e
  customer_logger.error('Error inesperado', e.message)
  handle_response(500, 'Error interno del servidor')
end

put '/envios/asignar' do
  @body = request.body.read
  parametros_envio = JSON.parse(@body)

  customer_logger.info("INFO: Petición put recibida en /envios/asignar con cuerpo: #{@body}")

  envio = ServicioEnvio.asignar_envio(parametros_envio)

  customer_logger.info("INFO: Envio id:#{params['id']} asignado a cadete con id:#{envio.cadete.id_cadete}")

  RepositorioEnvios.new.save(envio)

  handle_response(200, "Te asignamos el siguiente envio con ID *#{envio.id}*. \nRetirar el envio en *_#{envio.cliente.direccion.direccion}, #{envio.cliente.direccion.codigo_postal}_*. \nEntregar el envio en *_#{envio.direccion.direccion}, #{envio.direccion.codigo_postal}_*")
rescue EnvioNoEncontradoError
  handle_response(400, 'No hay envios disponibles')
rescue CadeteNoEncontradoError => e
  handle_response(404, e.message)
rescue CambioEstadoInvalidoError => e
  handle_response(400, e.message)
rescue StandardError => e
  customer_logger.error('Error inesperado', e.message)
  handle_response(500, 'Error interno del servidor')
end

put '/envios/:id' do
  @body = request.body.read
  parametros_envio = JSON.parse(@body)

  customer_logger.info("INFO: Petición put recibida en /envios/:id con cuerpo: #{@body}")

  envio = ServicioEnvio.actualizar_estado(params['id'], parametros_envio['estado'])
  customer_logger.info("INFO: Se Actualiza el envio con id: #{envio.id} al estado : #{envio.estado.estado}")

  status 200
  { text: ServicioEnvio.mensaje_confirmacion(params['id']), cliente: envio.cliente.id_cliente,
    text_to_client: ParseadorEstado.new.obtener_mensaje(envio) }.to_json
rescue EnvioNoEncontradoError
  handle_response(400, "No se encontró un envio con ID #{params['id']}")
rescue CambioEstadoInvalidoError => e
  handle_response(400, e.message)
rescue StandardError => e
  customer_logger.error('Error inesperado', e.message)
  handle_response(500, 'Error interno del servidor')
end

get '/clientes/:id' do
  customer_logger.info("INFO: Petición GET recibida en /clientes/id con id: #{params['id']} ")
  historial = ServicioEnvio.historial_de_envios(params['id'])

  customer_logger.info("INFO: Respuesta del estado de envio con id:#{params['id']}")
  handle_record_response(200, historial)
rescue EnvioNoEncontradoError
  handle_response(400, "No se encontró un envio con ID #{params['id']}")
rescue EnviosNoEncontradosError => e
  handle_response(400, e.message)
rescue ClienteNoEncontradoError
  handle_response(400, 'Para poder obtener el historial el usuario debe estar registrado')
rescue ParametrosInvalidosError => e
  handle_response(400, e.message)
rescue StandardError => e
  customer_logger.error('Error inesperado', e.message)
  handle_response(500, 'Error interno del servidor')
end

def handle_response(status_code, message)
  status status_code
  { text: message }.to_json
end

def handle_record_response(status_code, message)
  status status_code
  { texts: message }.to_json
end
