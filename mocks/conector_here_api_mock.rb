class ConectorHereApiMock
  def initialize(api_key)
    @api_key = api_key
  end

  def obtener_direccion(direccion, codigo_postal)
    return JSON.parse({}.to_json) if direccion == 'noexistedomicilio'

    body = { "items": [{
      "title": "#{direccion}, #{codigo_postal} Ciudad de Buenos Aires, Argentina",
      "resultType": 'street',
      "address": {
        "label": "#{direccion}, #{codigo_postal} Ciudad de Buenos Aires, Argentina",
        "countryCode": 'ARG',
        "countryName": 'Argentina',
        "stateCode": 'CF',
        "state": 'Ciudad Autónoma de Buenos Aires',
        "county": 'Ciudad de Buenos Aires',
        "city": 'Ciudad de Buenos Aires',
        "district": 'Recoleta',
        "street": 'General Las Heras',
        "postalCode": codigo_postal
      },
      "position": {
        "lat": -34.59218,
        "lng": -58.39141
      }
    }] }.to_json
    JSON.parse(body)
  end
end
