Y('hay un envio con direccion {string}, {string}') do |direccion, codigo_postal|
  @envio = Envio.new(direccion,codigo_postal,@cliente.id_cliente)
  RepositorioEnvios.new.save(@envio)
end

Dado('que hay registrado un cadete') do
  @cadete = Cadete.new('Juan', 'Moto', 2)
  RepositorioCadetes.new.save(@cadete)
end
  
Dado('que el envio esta sin asignar') do
  @envio.id_cadete = nil
  RepositorioEnvios.new.save(@envio)
end
  
Dado('que el envio esta asignado') do
  @envio.id_cadete = @cadete.id_cadete
  @envio.estado = 'en proceso'
  RepositorioEnvios.new.save(@envio)
end
  
Cuando('mando el mensaje {string}') do |_comando|
    @response = Faraday.get("/envios/#{@envio.id.to_s}", { 'Content-Type' => 'application/json' })
end

Entonces('deberia ver el id del envio') do
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response['text'].include?(@envio.id.to_s)).to eq true
end

Dado('que el envio esta entregado') do
  pending
end
