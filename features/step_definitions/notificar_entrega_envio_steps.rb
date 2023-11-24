Entonces('deberia ver un mensaje para el cliente {string}') do |mensaje|
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response['text_to_client'].include?(mensaje)).to eq true
end
