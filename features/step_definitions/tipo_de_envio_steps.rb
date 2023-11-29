Dado('que hay un envio {string} con direccion {string}, {string}') do |tipo_de_envio, direccion, codigo_postal|
  tipo = FabricaTipoEnvios.new.crear_tipo_de_envio(tipo_de_envio)
  RepositorioEnvios.new.delete_all
  direccion = Direccion.new(direccion, codigo_postal)
  RepositorioDirecciones.new.save(direccion)
  tamanio = Chico.new
  cliente = Cliente.new('Juan', direccion, 8)
  RepositorioClientes.new.save(cliente)
  @envio = Envio.new(tamanio, direccion, cliente, tipo)
  @envio.cadete = @cadete
  RepositorioEnvios.new.save(@envio)
end
