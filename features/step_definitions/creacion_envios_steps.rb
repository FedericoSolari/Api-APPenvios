Dado('que estoy registrado como cliente') do
  cliente = Cliente.new('Juan', 'Av Las Heras 1232', 'CP: 1425', 8)
  RepositorioClientes.new.save(cliente)
end

Y('que no hay envios creados') do
  RepositorioEnvios.new.delete_all
end

Entonces('se creo el envio con el ID {int}') do |_id|
end

Y('veo {string}') do |string|
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response['text'].include?(string)).to eq true
end

