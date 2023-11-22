require_relative '../ayudantes/parseador_solicitudes'

Dado('que no hay un cliente con el nombre {string}') do |_nombre|
  # Actualizar a eliminar clientes con nombre que pasan
    RepositorioClientes.new.delete_all
end

Dado('que no hay un cadete con el nombre {string}') do |_nombre|
  # Actualizar a eliminar clientes con nombre que pasan
  RepositorioClientes.new.delete_all
end
  
Cuando('envio el mensaje {string}') do |mensaje|
  datos_solicitud = ParseadorSolicitudes.new.parsear(mensaje)
  @response = Faraday.post(datos_solicitud[:comando], datos_solicitud[:body].to_json, { 'Content-Type' => 'application/json' })
end
  
Entonces('deberia ver un mensaje {string}') do |mensaje|
    parsed_response = JSON.parse(@response.body)
    expect(parsed_response['text'].gsub(/[\n*_]/, '')).to eq mensaje
end
