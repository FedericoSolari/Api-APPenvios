require_relative '../conectores/conector_here_api_routes'
require_relative '../mocks/conector_here_api_routes_mock'

class FabricaConectorHereApiRoutes
  def self.crear_conector_here_api_routes(api_key)
    case ENV['APP_ENV']
    when 'test'
      ConectorHereApiRoutesMock.new(api_key)
    else
      ConectorHereApiRoutes.new(api_key)
    end
  end
end
