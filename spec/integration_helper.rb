# rubocop:disable all
require 'spec_helper'
require_relative '../config/configuration'
require_relative '../persistencia/repositorio_clientes'
require_relative '../persistencia/repositorio_cadetes'
require_relative '../persistencia/repositorio_envios'

RSpec.configure do |config|
  config.before :suite do
    DB = Configuration.db
    Sequel.extension :migration
    logger = Configuration.logger
    db = Configuration.db
    db.loggers << logger
    Sequel::Migrator.run(db, 'db/migrations')
  end

  config.after :each do
    RepositorioEnvios.new.delete_all
    RepositorioClientes.new.delete_all
    RepositorioCadetes.new.delete_all
  end
end
