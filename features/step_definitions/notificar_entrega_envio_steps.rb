Dado('esta en proceso de entrega') do
  @envio.estado = 'proceso de entrega'
end

Entonces('deberia ver un mensaje para el cliente {string}') do |mensaje|
  parsed_response = JSON.parse(@response.body)
  puts "MENSAJE PARA EL CLIENTE: #{parsed_response['text_to_client']}"
  expect(parsed_response['text_to_client'].include?(mensaje)).to eq true
end
