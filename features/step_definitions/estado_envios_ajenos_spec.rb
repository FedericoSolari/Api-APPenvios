Dado('que hay un envio creado') do
    parametros_cliente = { 'nombre' => 'ernesto', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
    @cliente2 = ServicioUsuarios.agregar_cliente(parametros_cliente)

    parametros_envio = { 'tamanio' => 'chico', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
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
    @response = Faraday.get("/envios/#{@nuevo_envio.id.to_s}", { 'Content-Type' => 'application/json' })
  end
  