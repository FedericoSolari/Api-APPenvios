Dado('Que estoy registrado como cliente') do
    @repositorio_clientes = RepositorioClientes.new
    @repositorio_clientes.delete_all
    @cliente = Cliente.new("pedro","una_direccion","un_codigo_postal",1)
    @repositorio_clientes.save(@cliente)
end
  
Dado('existe el envio con el ID {int}') do |_envio_id|
    @repositorio_envios = RepositorioEnvios.new
    @repositorio_envios.delete_all
    @envio = Envio.new("una_direccion","un_codigo_postal",@cliente.id_cliente)
end
  
  Dado('con direccion {string}, {string}') do |direccion, codigo_postal|
    @envio.direccion = direccion
    @envio.codigo_postal = codigo_postal
    @repositorio_envios.save(@envio)
end
  
Dado('que el envio con ID {int} esta sin asignar') do |_envio_id|
end
  
Dado('que el envio con ID {int} esta entregado') do |_envio_id|
end
  
Cuando('Mando el comando {string} {string}') do |_comando, _id|
    @response = Faraday.get("/envios/#{@envio.id.to_s}", { 'Content-Type' => 'application/json' })
end
  
Entonces('deberia el mensaje {string}') do |_mensaje|
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response['text'].include?(@envio.id.to_s)).to eq true 
  expect(parsed_response['text'].include?("pendiente de asignación")).to eq true 
end

Dado('que el envio con ID {int} está entregado') do |_envio_id|
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response['text'].include?(@envio.id.to_s)).to eq true 
  expect(parsed_response['text'].include?("proceso de entrega")).to eq true 
end
  