require_relative '../modelos/direccion'
require 'web_mock'
require 'faraday'

def cuando_valido_domicilio(direccion, codigo_postal)
  body = { "items": [{
    "title": 'General Las Heras, C1018AAO Ciudad de Buenos Aires, Argentina',
    "id": 'here:af:streetsection:ZfBPNA4Pfddw6eWgKetVdC',
    "resultType": 'street',
    "address": {
      "label": 'General Las Heras, C1018AAO Ciudad de Buenos Aires, Argentina',
      "countryCode": 'ARG',
      "countryName": 'Argentina',
      "stateCode": 'CF',
      "state": 'Ciudad Autónoma de Buenos Aires',
      "county": 'Ciudad de Buenos Aires',
      "city": 'Ciudad de Buenos Aires',
      "district": 'Recoleta',
      "street": 'General Las Heras',
      "postalCode": 'C1018AAO'
    },
    "position": {
      "lat": -34.59218,
      "lng": -58.39141
    }
  }] }

  stub_request(:get, "https://geocode.search.hereapi.com/v1/geocode?q=#{direccion},#{codigo_postal}CABA&apiKey=")
    .to_return(body: body.to_json, status: 200, headers: { 'Content-Length' => 3 })
end

describe 'Direccion' do
  it 'Debería retornar los parámetros de registrar cliente' do
    cuando_valido_domicilio('Av Las Heras 1232', '1018')
    direccion = Direccion.new('Av Las Heras 1232', 'CP: 1018')
    expect(direccion.valid?).to eq(true)
  end
end
