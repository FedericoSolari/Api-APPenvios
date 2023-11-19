require_relative '../modelos/direccion'

def cuando_valido_domicilio(direccion, codigo_postal)
  body = { "items": [{
    "title": '5 Rue Daunou, 75002 Paris, France',
    "id": 'here:af:streetsection:bI4Le6cyA.1mlQyLunYpjC:CggIBCCi-9SPARABGgE1KGQ',
    "resultType": 'houseNumber',
    "houseNumberType": 'PA',
    "address": {
      "label": '5 Rue Daunou, 75002 Paris, France',
      "countryCode": 'FRA',
      "countryName": 'France',
      "stateCode": 'IDF',
      "state": 'Île-de-France',
      "county": 'Paris',
      "city": 'Paris',
      "district": '2e Arrondissement',
      "street": 'Rue Daunou',
      "postalCode": '75002',
      "houseNumber": '5'
    },
    "position": {
      "lat": 48.86926,
      "lng": 2.3321
    }
  }] }

  stub_request(:get, "https://geocode.search.hereapi.com/v1/geocode?q=#{direccion},#{codigo_postal}CABA&apiKey=Uzz6vH2XekHzbN852dERrr8_rCR086eq7jAEpQbmzX4")
    .to_return(body: body.to_json, status: 200, headers: { 'Content-Length' => 3 })
end

describe 'Direccion' do
  xit 'Debería retornar los parámetros de registrar cliente' do
    cuando_valido_domicilio('Av Las Heras 1232', '1425')
    direccion = Direccion.new('Av Las Heras 1232', '1425')
    expect(direccion.valid?).to eq(true)
  end
end
