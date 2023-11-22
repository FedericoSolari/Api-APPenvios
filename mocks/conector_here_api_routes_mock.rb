class ConectorHereApiRoutesMock
  def initialize(api_key)
    @api_key = api_key
  end

  # rubocop:disable Metrics/MethodLength
  def obtener_duracion_viaje(latitud_origen, longitud_origen, latitud_destino, longitud_destino, _vehiculo = 'car')
    body = {
      "routes": [
        {
          "id": '1793a897-0843-4957-ab63-c61e0f13aff2',
          "sections": [
            {
              "id": 'c3e300ab-a880-4fab-9bb2-702355b2bf6b',
              "type": 'vehicle',
              "actions": [
                {
                  "action": 'depart',
                  "duration": 126,
                  "instruction": 'Head toward Chausseestraße on Invalidenstraße. Go for 1.2 km.',
                  "offset": 0
                },
                {
                  "action": 'arrive',
                  "duration": 0,
                  "instruction": 'Arrive at Invalidenstraße.',
                  "offset": 78
                }
              ],
              "departure": {
                "time": '2019-12-05T15:15:56+01:00',
                "place": {
                  "type": 'place',
                  "location": {
                    "lat": latitud_origen,
                    "lng": longitud_origen
                  }
                }
              },
              "arrival": {
                "time": '2019-12-05T15:18:02+01:00',
                "place": {
                  "type": 'place',
                  "location": {
                    "lat": latitud_destino,
                    "lng": longitud_destino
                  }
                }
              },
              "summary": {
                "duration": 126,
                "length": 1200
              },
              "spans": [
                {
                  "offset": 0,
                  "names": [
                    {
                      "value": 'Invalidenstraße',
                      "language": 'de'
                    }
                  ],
                  "length": 787
                },
                {
                  "offset": 49,
                  "names": [
                    {
                      "value": 'Invalidenstraße',
                      "language": 'de'
                    },
                    {
                      "value": 'Sandkrugbrücke',
                      "language": 'de'
                    }
                  ],
                  "length": 51
                },
                {
                  "offset": 57,
                  "names": [
                    {
                      "value": 'Invalidenstraße',
                      "language": 'de'
                    }
                  ],
                  "length": 362
                }
              ],
              "transport": {
                "mode": 'car'
              }
            }
          ]
        }
      ]
    }.to_json
    JSON.parse(body)
  end
  # rubocop:enable Metrics/MethodLength
end
