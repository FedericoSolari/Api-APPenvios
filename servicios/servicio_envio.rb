Dir[File.join(__dir__, 'persistencia', '*.rb')].each { |file| require file }
require_relative './servicio_direccion'

class ServicioEnvio
  def self.agregar_envio(parametros_envio)
    direccion = ServicioDireccion.obtener_direccion(parametros_envio['direccion'], parametros_envio['codigo_postal'])
    envio = Envio.new(FabricaTamanios.new.crear_tamanio(parametros_envio['tamanio']), direccion,
                      RepositorioClientes.new.find_by_id(parametros_envio['id_cliente']))
    RepositorioEnvios.new.save(envio)
    envio
  end

  def self.asignar_envio(parametros_envio)
    envio = RepositorioEnvios.new.find_by_state('pendiente de asignacion')
    cadete = RepositorioCadetes.new.find_by_id(parametros_envio['id_cadete'])
    envio.cadete = cadete
    envio.estado = FabricaEstados.new.crear_estado('en proceso')
    envio
  end
end
