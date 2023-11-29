Y('hay un envio con direccion {string}, {string}') do |direccion, codigo_postal|
  RepositorioEnvios.new.delete_all
  direccion = Direccion.new(direccion, codigo_postal)
  RepositorioDirecciones.new.save(direccion)
  tamanio = Chico.new
  @envio = Envio.new(tamanio, direccion, @cliente, Clasico.new)
  @envio.cadete = @cadete
  RepositorioEnvios.new.save(@envio)
end

Dado('que hay registrado un cadete') do
  @cadete = Cadete.new('Juan', Moto.new, 2)
  RepositorioCadetes.new.save(@cadete)
end

Dado('que el envio esta {string}') do |estado|
  if estado != 'pendiente de asignacion'
    @envio.cadete = @cadete
    @envio.estado = FabricaEstados.new.crear_estado(estado)
    RepositorioEnvios.new.save(@envio)
  end
  expect(@envio.estado.estado).to eq estado
end

Cuando('mando el mensaje {string}') do |_comando|
  datos_solicitud = {body: { id_cliente: 8 } }
  @response = Faraday.post("/envios/#{@envio.id.to_s}", datos_solicitud[:body].to_json, { 'Content-Type' => 'application/json' })
end

Entonces('deberia ver el id del envio') do
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response['text'].include?(@envio.id.to_s)).to eq true
end
