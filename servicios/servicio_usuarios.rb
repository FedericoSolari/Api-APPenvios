Dir[File.join(__dir__, 'persistencia', '*.rb')].each { |file| require file }
require_relative './servicio_direccion'
require_relative '../validadores/validador_parametros'

class ServicioUsuarios
  def self.agregar_cliente(parametros_cliente)
    direccion = ServicioDireccion.obtener_direccion(parametros_cliente['direccion'], parametros_cliente['codigo_postal'])
    cliente = Cliente.new(parametros_cliente['nombre'], direccion, parametros_cliente['id_cliente'])
    RepositorioClientes.new.save(cliente)
    cliente
  end

  def self.agregar_cadete(parametros_cadete)
    ValidadorParametros.new.validar_vehiculo(parametros_cadete['vehiculo'])
    cadete = Cadete.new(parametros_cadete['nombre'], parametros_cadete['vehiculo'], parametros_cadete['id_cadete'])

    RepositorioCadetes.new.save(cadete)
    cadete
  end
end
