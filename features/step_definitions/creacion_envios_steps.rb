Dado('que estoy registrado como cliente') do
  @cliente = Cliente.new('Juan', 'Av Las Heras 1232', 'CP: 1018', 8)
  RepositorioClientes.new.save(@cliente)
end

Y('que no hay envios creados') do
  RepositorioEnvios.new.delete_all
end

Entonces('deberia ver un mensaje que incluya {string}') do |mensaje|
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response['text'].include?(mensaje)).to eq true
end

