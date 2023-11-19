require_relative '../conectores/conector_here_api'

describe 'ConectorHereApi' do
  it 'Estado de respuesta de HereApi OK' do
    WebMock.allow_net_connect!
    response = ConectorHereApi.new('-ZgDQiB9BtkuI_pYPTuXDKIEtTX-qjZyPmZJEyVE-Zs').obtener_direccion(
      'Av Las Heras 1232', '1425'
    )
    expect(response['items'].empty?).to eq(false)
  end
end
