Dado('que no hay un cadete con el nombre Pedro') do
    RepositorioClientes.new.delete_all
end

Entonces('deberia ver un mensaje de {string}') do |string|
    parsed_response = JSON.parse(@response.body)
    expect(parsed_response['text']).to eq string
end
