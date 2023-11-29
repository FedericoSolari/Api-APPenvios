Y('hay {int} envios creados') do |cantidad|
    direccion = Direccion.new("Cerrito 628", "CP: 1049")
    RepositorioDirecciones.new.save(direccion)
    tamanio = Chico.new
    cantidad.times do |i|
        envio = Envio.new(tamanio, direccion, @cliente, Clasico.new)
        RepositorioEnvios.new.save(envio)
    end
end

Cuando('se envia el mensaje {string}') do |string|
    @historial = Faraday.get("/clientes/#{@cliente.id_cliente}")
end

Entonces('deberia ver mensajes que incluyan {string}') do |mensaje|
    parsed_historial = JSON.parse(@historial.body)
    parsed_historial['texts'].each do |registro|
        expect(registro['text'].gsub(/[\n*_]/, '').include?(mensaje)).to eq true
    end
  end
