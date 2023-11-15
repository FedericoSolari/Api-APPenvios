Dado('que no hay un cadete con el nombre Pedro') do
    RepositorioClientes.new.delete_all
end

Cuando('envio el mensaje {string}.') do |string|
    regex = %r{^(\/\w+)\s+(\w+),\s+(.*)$}
    parametros = string.match(regex)
    request_body = {nombre: parametros[2], vehiculo: parametros[3], id_cadete: 8}.to_json
    @response = Faraday.post(parametros[1], request_body, { 'Content-Type' => 'application/json' })
end


Entonces('deberia ver un mensaje de {string}') do |string|
    parsed_response = JSON.parse(@response.body)
    expect(parsed_response['text']).to eq string
end
  