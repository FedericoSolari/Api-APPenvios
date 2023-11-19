describe 'ConectorHereApi' do
  xit 'Estado de respuesta de HereApi OK' do
    WebMock.allow_net_connect!
    response = ConectorHereApi.new.obtener_direccion('-ZgDQiB9BtkuI_pYPTuXDKIEtTX-qjZyPmZJEyVE-Zs',
                                                     'Av Las Heras 1232', '1425')
    expect(response.body['items'].empty?).to eq(false)
  end
end
