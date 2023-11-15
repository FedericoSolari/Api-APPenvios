require_relative '../../modelos/ayudantes/parseador_solicitudes'

Dado('que no hay un usuario con el nombre Juan') do
    RepositorioClientes.new.delete_all
end
  
Cuando('envio el mensaje {string}') do |string|
  datos_solicitud = ParseadorSolicitudes.new.parsear(string)
  @response = Faraday.post(datos_solicitud[:comando], datos_solicitud[:body].to_json, { 'Content-Type' => 'application/json' })
end
  
Entonces('deberia ver un mensaje {string}') do |string|
    parsed_response = JSON.parse(@response.body)
    expect(parsed_response['text']).to eq string
end
