Dado('que hay un envio creado') do
    parametros_cliente = { 'nombre' => 'ernesto', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
    @cliente2 = ServicioUsuarios.agregar_cliente(parametros_cliente)

    parametros_envio = { 'tipo' => 'clasico', 'tamanio' => 'chico', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
    @nuevo_envio = ServicioEnvio.agregar_envio(parametros_envio)
  end

  Dado('que me registro como cliente') do
    direccion = Direccion.new('Av Las Heras 1232', 'CP: 1018')
    RepositorioDirecciones.new.save(direccion)
    @nuevo_cliente = Cliente.new('patroclo', direccion, 22)
    RepositorioClientes.new.save(@nuevo_cliente)
  end

  Dado('no tengo envios asociados') do
  end

  Cuando('consulto el estado del envio que esta creado') do
    datos_solicitud = {body: { id_cliente: @nuevo_cliente.id_cliente } }
    @response = Faraday.post("/envios/#{@nuevo_envio.id.to_s}", datos_solicitud[:body].to_json, { 'Content-Type' => 'application/json' })
  end
