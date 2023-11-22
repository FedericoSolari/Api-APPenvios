require_relative '../conectores/conector_here_api'
require 'dotenv'
Dotenv.load('.env')

describe 'ConectorHereApi' do
  it 'Estado de respuesta de HereApi OK' do
    WebMock.allow_net_connect!
    response = ConectorHereApi.new(ENV['HERE_API_KEY']).obtener_direccion(
      'Av Las Heras 1232', '1018'
    )
    expect(response['items'].empty?).to eq(false)
  end
end
