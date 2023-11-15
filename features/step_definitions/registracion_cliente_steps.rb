Dado('que no hay un usuario con el nombre Juan') do
    RepositorioClientes.new.delete_all
end
  
Cuando('envio el mensaje {string}') do |string|
    regex = %r{^(\/\w+)\s+(\w+),\s+(.*?),\s+(CP:\s+\d+)$}
    parametros = string.match(regex)
    request_body = {nombre: parametros[2], direccion: parametros[3], codigo_postal: parametros[4], id_cliente: parametros[5]}.to_json
    @response = Faraday.post(parametros[1], request_body, { 'Content-Type' => 'application/json' })
end
  
Entonces('deberia ver un mensaje {string}') do |string|
    parsed_response = JSON.parse(@response.body)
    expect(parsed_response['text']).to eq string
end
  