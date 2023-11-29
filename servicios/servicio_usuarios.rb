Dir[File.join(__dir__, 'persistencia', '*.rb')].each { |file| require file }
require_relative './servicio_direccion'
require_relative '../validadores/validador_parametros'
require_relative '../fabricas/fabrica_vehiculos'

class ServicioUsuarios
  def self.agregar_cliente(parametros_cliente)
    raise UsuarioDuplicadoError unless RepositorioClientes.new.find_by_name(parametros_cliente['nombre']).nil?

    direccion = ServicioDireccion.obtener_direccion(parametros_cliente['direccion'], parametros_cliente['codigo_postal'])

    cliente = Cliente.new(parametros_cliente['nombre'], direccion, parametros_cliente['id_cliente'])
    RepositorioClientes.new.save(cliente)
    cliente
  end

  def self.agregar_cadete(parametros_cadete)
    raise UsuarioDuplicadoError unless RepositorioCadetes.new.find_by_name(parametros_cadete['nombre']).nil?

    ValidadorParametros.new.validar_vehiculo(parametros_cadete['vehiculo'])
    vehiculo = FabricaVehiculos.new.crear_vehiculo(parametros_cadete['vehiculo'])

    cadete = Cadete.new(parametros_cadete['nombre'], vehiculo, parametros_cadete['id_cadete'])

    RepositorioCadetes.new.save(cadete)
    cadete
  end
end
