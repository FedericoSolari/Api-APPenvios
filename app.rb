require 'sinatra'
require 'sequel'
require 'sinatra/custom_logger'
require_relative './config/configuration'
require_relative './modelos/ayudantes/parseador_estado'
require_relative './excepciones/ciudad_incorrecta_error'
require_relative './excepciones/domicilio_inexistente_error'
require_relative './fabricas/fabrica_tamanios'
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
    cliente = ServicioCliente.agregar_cliente(parametros_cliente)
    customer_logger.info("INFO: Cliente registrado exitosamente: #{cliente.nombre}")
    status 201
    { text: "Bienvenid@ #{cliente.nombre}. Las coordenadas de tu domicilio son: " \
      "Lat: #{cliente.direccion.latitud}, Lng: #{cliente.direccion.longitud}" }.to_json
  rescue CiudadIncorrectaError
    status 400
    { text: "La dirección que se proporcionó no se encuentra en #{ENV['CIUDAD']}" }.to_json
  rescue DomicilioInexistenteError
    status 400
    { text: 'El domicilio ingresado no existe' }.to_json
  rescue StandardError => e
    customer_logger.error('Error inesperado', e.message)
    status 400
    { text: 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>' }.to_json
  end
end

post '/registrar_cadete' do
  @body ||= request.body.read
  parametros_cadete = JSON.parse(@body)

  customer_logger.info("INFO: Petición POST recibida en /registrar_cadete con cuerpo: #{@body}")

  cadete = Cadete.new(parametros_cadete['nombre'], parametros_cadete['vehiculo'], parametros_cadete['id_cadete'])
  customer_logger.info("INFO: Cadete registrado exitosamente: #{cadete.nombre}")
  RepositorioCadetes.new.save(cadete)
  status 201
  { text: "Bienvenid@ a la flota #{cadete.nombre}" }.to_json
end

post '/envios' do
  @body ||= request.body.read
  parametros_envio = JSON.parse(@body)
  customer_logger.info("INFO: Petición POST recibida en /envios con cuerpo: #{@body}")
  begin
    envio = ServicioEnvio.agregar_envio(parametros_envio)
    customer_logger.info("INFO: Envio creado exitosamente: #{envio.id}")
    status 201
    { text: "Se registró tu envio con el ID: #{envio.id}. Las coordenadas del domicilio de entrega son: "\
    "Lat: #{envio.direccion.latitud}, Lng: #{envio.direccion.longitud}" }.to_json
  rescue CiudadIncorrectaError
    status 400
    { text: "La dirección que se proporcionó no se encuentra en #{ENV['CIUDAD']}" }.to_json
  rescue DomicilioInexistenteError
    status 400
    { text: 'El domicilio ingresado no existe' }.to_json
  rescue TamanioIncorrectoError => e
    status 400
    { text: e.message }.to_json
  rescue StandardError
    status 400
    { text: 'Verifique haber ingresado los datos necesarios, el formato correcto es: <Domicilio> <Altura>, CP: <codigo postal>' }.to_json
  end
end

get '/envios/:id' do
  customer_logger.info("INFO: Petición get recibida en /envios/id con id: #{params['id']}")
  envio = RepositorioEnvios.new.find(params['id'])
  texto = ParseadorEstado.new.obtener_mensaje(envio)
  customer_logger.info("INFO: Envio id:#{params['id']} con estado: #{envio.estado.estado}")
  status 201
  { text: texto }.to_json
rescue StandardError => e
  status 400
  { text: e.message }.to_json
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
  status 201
  { text: "Te asignamos el siguiente envio con ID #{envio.id}. Retirar el envio en #{envio.cliente.direccion.direccion}, #{envio.cliente.direccion.codigo_postal}. Entregar el envio en #{envio.direccion.direccion}, #{envio.direccion.codigo_postal}" }.to_json
rescue StandardError
  status 400
  { text: 'Envio no encontrado' }.to_json
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
    text_to_client: "Ya entregamos tu envío (ID: #{envio.id})" }.to_json
rescue StandardError => e
  customer_logger.error('Error inesperado', e.message)
  status 400
  { text: 'Envio no encontrado' }.to_json
end
