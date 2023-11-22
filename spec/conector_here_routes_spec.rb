# require_relative '../conectores/conector_here_api_routes'

describe 'ConectorHereApiRoutes' do
  xit 'Estado de respuesta de HereApiRoutes OK' do
    WebMock.allow_net_connect!
    origen = '-34.59218%2C-58.39141'
    destino = '-34.59218%2C-58.39141'
    response = ConectorHereApiRoutes.new('-ZgDQiB9BtkuI_pYPTuXDKIEtTX-qjZyPmZJEyVE-Zs').obtener_duracion_viaje(
      origen, destino
    )
    expect(response['items'].empty?).to eq(false)
  end
end
