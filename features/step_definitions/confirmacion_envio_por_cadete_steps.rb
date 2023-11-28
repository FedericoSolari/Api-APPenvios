Dado('estoy asignado al envio') do
    @envio.cadete = @cadete
    RepositorioEnvios.new.save(@envio)
end

Dado('con estado {string}') do |estado|
    @envio.estado = FabricaEstados.new.crear_estado(estado)
    RepositorioEnvios.new.save(@envio)
end

Cuando('confirmo entrega con {string}') do |mensaje|
    datos_solicitud = {estado: 'entregado'}
    @response = Faraday.put("/envios/#{@envio.id.to_s}", datos_solicitud.to_json, { 'Content-Type' => 'application/json' })
end

Dado('que el estado del envio se encuentra {string}') do |estado|
  @envio.estado = FabricaEstados.new.crear_estado(estado)
  RepositorioEnvios.new.save(@envio)
  end
  
Cuando('confirmo retiro con {string}') do |mensaje|
    datos_solicitud = {estado: 'en camino'}
    @response = Faraday.put("/envios/#{@envio.id.to_s}", datos_solicitud.to_json, { 'Content-Type' => 'application/json' })
end
  
