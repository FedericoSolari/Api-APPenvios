require 'sinatra'
require 'sequel'
require 'sinatra/custom_logger'
require_relative './config/configuration'
require_relative './modelos/ayudantes/parseador_estado'
require_relative './excepciones/ciudad_incorrecta_error'
require_relative './excepciones/domicilio_inexistente_error'
require_relative './lib/version'
Dir[File.join(__dir__, 'dominio', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'persistencia', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'modelos', '*.rb')].each { |file| require file }

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
  begin
    cliente = Cliente.new(parametros_cliente['nombre'], parametros_cliente['direccion'], parametros_cliente['codigo_postal'], parametros_cliente['id_cliente'])
    RepositorioClientes.new.save(cliente)
    status 201
    { text: "Bienvenid@ #{cliente.nombre}. Las coordenadas de tu domicilio son: " \
      "Lat: #{cliente.direccion.latitud}, Lng: #{cliente.direccion.longitud}" }.to_json
  rescue CiudadIncorrectaError
    status 400
    { text: "La dirección que se proporcionó no se encuentra en #{ENV['CIUDAD']}" }.to_json
  rescue DomicilioInexistenteError
    status 400
    { text: 'El domicilio ingresado no existe' }.to_json
  rescue StandardError
    status 400
    { text: 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>' }.to_json
  end
end

post '/registrar_cadete' do
  @body ||= request.body.read
  parametros_cadete = JSON.parse(@body)

  cadete = Cadete.new(parametros_cadete['nombre'], parametros_cadete['vehiculo'], parametros_cadete['id_cadete'])
  RepositorioCadetes.new.save(cadete)
  status 201
  { text: "Bienvenid@ a la flota #{cadete.nombre}" }.to_json
end

post '/envios' do
  @body ||= request.body.read
  parametros_envio = JSON.parse(@body)
  begin
    envio = Envio.new(parametros_envio['direccion'], parametros_envio['codigo_postal'], parametros_envio['id_cliente'])
    RepositorioEnvios.new.save(envio)
  rescue CiudadIncorrectaError
    status 400
    { text: "La dirección que se proporcionó no se encuentra en #{ENV['CIUDAD']}" }.to_json
  rescue DomicilioInexistenteError
    status 400
    { text: 'No se encontró un domicilio existente' }.to_json
  end
  status 201
  { text: "Se registró tu envio con el ID: #{envio.id}" }.to_json
end

get '/envios/:id' do
  envio = RepositorioEnvios.new.find(params['id'])
  if envio.nil?
    status 400
    { text: 'No existe el envio' }.to_json
  else
    texto = ParseadorEstado.new.obtener_mensaje(envio.id, envio.estado)
    status 201
    { text: texto }.to_json
  end
end

put '/envios/asignar' do
  @body ||= request.body.read
  parametros_envio = JSON.parse(@body)

  envio = RepositorioEnvios.new.find_unassigned
  if envio.nil?
    status 400
    { text: 'No hay envios disponibles para realizar' }.to_json
  else
    envio.id_cadete = parametros_envio['id_cadete'].to_i
    envio.estado = 'en proceso'
    RepositorioEnvios.new.save(envio)
    cliente = RepositorioClientes.new.find_by_id(envio.id_cliente)
    status 201
    { text: "Te asignamos el siguiente envio con ID #{envio.id}. Retirar el envio en #{cliente.direccion.direccion}, #{cliente.direccion.codigo_postal}. Entregar el envio en #{envio.direccion.direccion}, #{envio.direccion.codigo_postal}" }.to_json
  end
end

put '/envios/:id' do
  @body ||= request.body.read
  parametros_envio = JSON.parse(@body)

  envio = RepositorioEnvios.new.find(params['id'])
  if envio.nil?
    status 400
    { text: 'No hay envios registrados con ese id' }.to_json
  else
    envio.estado = parametros_envio['estado']
    RepositorioEnvios.new.save(envio)
    status 201
    { text: 'Gracias por entregar el envio!' }.to_json
  end
end
