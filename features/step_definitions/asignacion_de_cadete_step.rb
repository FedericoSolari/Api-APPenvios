Dado('que hay registrado un cliente con domicilio {string}, {string}') do |direccion, codigo_postal|
    direccion = Direccion.new(direccion, codigo_postal)
    RepositorioDirecciones.new.save(direccion)
    @cliente = Cliente.new("Pedro", direccion, 8)
    RepositorioClientes.new.save(@cliente)
end

Dado('que estoy registrado como cadete') do
  @cadete = Cadete.new('Juan', Moto.new, 2)
  RepositorioCadetes.new.save(@cadete)
end

Cuando('envio el comando {string}') do |_comando|
    datos_solicitud = {id_cadete: @cadete.id_cadete}
    @response = Faraday.put('/envios/asignar', datos_solicitud.to_json, { 'Content-Type' => 'application/json' })
end

Entonces('se me asigna un envio') do
  @envio.cadete = @cadete
  RepositorioEnvios.new.save(@envio)
end
