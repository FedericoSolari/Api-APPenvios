Cuando('mando el mensaje {string} con ID de envio inexistente') do |string|
  RepositorioEnvios.new.delete_all
  datos_solicitud = { comando: '/envios/1', body: { id_cliente: 8 } }
  @response = Faraday.post(datos_solicitud[:comando], datos_solicitud[:body].to_json, { 'Content-Type' => 'application/json' })
end
