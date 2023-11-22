Dir[File.join(__dir__, 'persistencia', '*.rb')].each { |file| require file }

class ServicioCliente
  def self.agregar_cliente(parametros_cliente)
    direccion = RepositorioDirecciones.new.find_by_address(parametros_cliente['direccion'], parametros_cliente['codigo_postal'])
    if direccion.nil?
      direccion = Direccion.new(parametros_cliente['direccion'], parametros_cliente['codigo_postal'])
      RepositorioDirecciones.new.save(direccion)
    end
    cliente = Cliente.new(parametros_cliente['nombre'], direccion, parametros_cliente['id_cliente'])
    RepositorioClientes.new.save(cliente)
    cliente
  end
end
