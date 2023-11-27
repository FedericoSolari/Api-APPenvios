require_relative '../conectores/conector_here_api_routes'
require 'dotenv'
Dotenv.load('.env')

describe 'ConectorHereApiRoutes' do
  it 'Estado de respuesta de HereApiRoutes OK' do
    WebMock.allow_net_connect!
    latitud_origen = '-34.59218'
    longitud_origen = '-58.39141'
    latitud_destino = '-34.59218'
    longitud_destino = '-58.39141'
    response = ConectorHereApiRoutes.new(ENV['HERE_API_KEY']).obtener_duracion_viaje(
      latitud_origen, longitud_origen, latitud_destino, longitud_destino, 'auto'
    )
    expect(response.nil?).to eq(false)
  end
end
