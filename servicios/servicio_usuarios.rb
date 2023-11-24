Dir[File.join(__dir__, 'persistencia', '*.rb')].each { |file| require file }
require_relative './servicio_direccion'

class ServicioUsuarios
  def self.agregar_cliente(parametros_cliente)
    direccion = ServicioDireccion.obtener_direccion(parametros_cliente['direccion'], parametros_cliente['codigo_postal'])
    cliente = Cliente.new(parametros_cliente['nombre'], direccion, parametros_cliente['id_cliente'])
    RepositorioClientes.new.save(cliente)
    cliente
  end
end
