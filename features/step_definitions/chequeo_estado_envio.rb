Y('hay un envio con direccion {string}, {string}') do |direccion, codigo_postal|
  tamanio = Chico.new
  @envio = Envio.new(tamanio, direccion,codigo_postal,@cliente)
  RepositorioEnvios.new.save(@envio)
end

Dado('que hay registrado un cadete') do
  @cadete = Cadete.new('Juan', 'Moto', 2)
  RepositorioCadetes.new.save(@cadete)
end
  
Dado('que el envio esta {string}') do |estado|
  if estado != 'pendiente de asignacion'
    @envio.asignar_cadete(@cadete)
    @envio.con_estado(FabricaEstados.new.crear_estado(estado))
    RepositorioEnvios.new.save(@envio)
  end
  expect(@envio.estado.estado).to eq estado
end
  
Cuando('mando el mensaje {string}') do |_comando|
    @response = Faraday.get("/envios/#{@envio.id.to_s}", { 'Content-Type' => 'application/json' })
end

Entonces('deberia ver el id del envio') do
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response['text'].include?(@envio.id.to_s)).to eq true
end

