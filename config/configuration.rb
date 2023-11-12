require 'semantic_logger'
require 'sequel'

class Configuration
  def self.logger
    SemanticLogger.default_level = (ENV['LOG_LEVEL'] || 'info').to_sym
    SemanticLogger.add_appender(io: $stdout)
    log_url = ENV['LOG_URL']
    unless log_url.nil? || log_url.empty?
      SemanticLogger.add_appender(
        appender: :http,
        url: log_url
      )
    end
    SemanticLogger['restapi']
  end

  def self.db
    database_url = ENV['DATABASE_URL']
    case ENV['APP_ENV']
    when 'test'
      database_url = ENV['TEST_DB_URL'] || "postgresql://memo2.calii:#{ENV['NEON_API_KEY']}@ep-royal-silence-96815811.us-west-2.aws.neon.tech/Test?sslmode=require"
    when 'development'
      database_url = ENV['DEV_DB_URL'] || "postgresql://memo2.calii:#{ENV['NEON_API_KEY']}@ep-royal-silence-96815811.us-west-2.aws.neon.tech/Prod?sslmode=require"
    end
    Sequel::Model.raise_on_save_failure = true
    Sequel.connect(database_url)
  end
end
