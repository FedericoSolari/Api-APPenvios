require 'sinatra'
require 'sequel'
require 'sinatra/custom_logger'
require_relative './config/configuration'
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
  RepositorioUsuarios.new.delete_all
  status 200
end

get '/usuarios' do
  usuarios = RepositorioUsuarios.new.all
  respuesta = []
  usuarios.map { |u| respuesta << { email: u.email, id: u.id } }
  status 200
  respuesta.to_json
end

post '/usuarios' do
  @body ||= request.body.read
  parametros_usuario = JSON.parse(@body)

  usuario = Usuario.new(parametros_usuario['email'])
  RepositorioUsuarios.new.save(usuario)
  status 201
  { id: usuario.id, email: usuario.email }.to_json
end

post '/registrar' do
  @body ||= request.body.read
  parametros_cliente = JSON.parse(@body)

  cliente = Cliente.new(parametros_cliente['nombre'], parametros_cliente['direccion'], parametros_cliente['codigo_postal'], parametros_cliente['id_cliente'])
  RepositorioClientes.new.save(cliente)
  status 201
  { text: "Bienvenid@ #{cliente.nombre}" }.to_json
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

  envio = Envio.new(parametros_envio['direccion'], parametros_envio['codigo_postal'], parametros_envio['id_cliente'])
  RepositorioEnvios.new.save(envio)
  status 201
  { text: "Se registró tu envio con el ID: #{envio.id}" }.to_json
end
