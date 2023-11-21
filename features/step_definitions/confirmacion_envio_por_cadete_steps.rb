Dado('estoy asignado al envio') do
    @envio.asignar_cadete(@cadete)
    RepositorioEnvios.new.save(@envio)
end

Dado('con estado {string}') do |estado|
    @envio.con_estado(FabricaEstados.new.crear_estado(estado))
    RepositorioEnvios.new.save(@envio)
end

Cuando('confirmo entrega con {string}') do |mensaje|
    datos_solicitud = {estado: 'entregado'}
    @response = Faraday.put("/envios/#{@envio.id.to_s}", datos_solicitud.to_json, { 'Content-Type' => 'application/json' })
end

