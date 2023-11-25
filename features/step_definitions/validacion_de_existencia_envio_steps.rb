Cuando('mando el mensaje {string} con ID de envio inexistente') do |string|
  RepositorioEnvios.new.delete_all
  @response = Faraday.get("/envios/1", { 'Content-Type' => 'application/json' })
end
