require_relative '../conectores/conector_here_api'
require_relative '../mocks/conector_here_api_mock'

class FabricaConectorHereApi
  def self.crear_conector_here_api(api_key)
    case ENV['APP_ENV']
    when 'test'
      ConectorHereApiMock.new(api_key)
    else
      ConectorHereApi.new(api_key)
    end
  end
end
