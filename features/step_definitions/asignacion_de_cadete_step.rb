Dado('Que hay un cliente') do
    @repositorio_clientes = RepositorioClientes.new
    @repositorio_clientes.delete_all
    @cliente = Cliente.new("pedro","una_direccion","un_codigo_postal",1)
    @repositorio_clientes.save(@cliente)
end

Dado('Que estoy registrado como cadete') do
    repositorio_cadetes = RepositorioCadetes.new
    repositorio_cadetes.delete_all
    @cadete = Cadete.new("pedro","moto",1)
    repositorio_cadetes.save(@cadete)
end

Dado('Que hay un envio sin asignar con ID') do
    @repositorio_envios = RepositorioEnvios.new
    @repositorio_envios.delete_all
    @envio = Envio.new("una_direccion","un_codigo_postal",@cliente.id_cliente)
    @repositorio_envios.save(@envio)
end

Dado('Con domicilio origen {string}, {string} y destino {string}, {string}') do |origen, cp_origen, destino, cp_destino|
    @cliente.direccion = origen
    @cliente.codigo_postal = cp_origen
    @envio.direccion = destino
    @envio.codigo_postal = cp_destino
    @repositorio_clientes.save(@cliente)
    @repositorio_envios.save(@envio)
end

Cuando('Mando el comando {string}') do |string|
    datos_solicitud = {id_cadete:@cadete.id_cadete}
    @response = Faraday.put('/envios/asignar', datos_solicitud.to_json, { 'Content-Type' => 'application/json' })
end

Entonces('Te asignamos el siguiente envio') do
    parsed_response = JSON.parse(@response.body)
    expect(parsed_response['text'].include?(@envio.id.to_s)).to eq true     
end

Entonces('Veo el domicilio origen y destino') do
    parsed_response = JSON.parse(@response.body)
    expect(parsed_response['text'].include?(@cliente.direccion.to_s)).to eq true     
    expect(parsed_response['text'].include?(@envio.direccion.to_s)).to eq true     
end
