require_relative './abstract_repository'
require_relative '../fabricas/fabrica_estados'
require_relative '../fabricas/fabrica_tamanios'
require_relative '../excepciones/envio_no_encontrado_error'
require_relative '../excepciones/objeto_no_encontrado_error'

class RepositorioEnvios < AbstractRepository
  self.table_name = :envios
  self.model_class = 'Envio'

  def find_by_state(estado)
    envio = dataset.where(estado:).first
    raise EnvioNoEncontradoError, "No se encontraron envios con estado #{estado}" if envio.nil?

    load_object(envio)
  end

  def find_by_state_and_size(estado, tamanios)
    envio = dataset.where(estado:, tamanio: tamanios).first
    raise EnvioNoEncontradoError, "No se encontraron envios con estado #{estado} y tamanio/s #{tamanios}" if envio.nil?

    load_object(envio)
  end

  def client_record(duenio)
    envios = dataset.where(duenio: duenio.downcase).limit(5)
    raise EnvioNoEncontradoError, "No se encontraron envíos para el dueño #{duenio}" if envios.empty?

    load_collection(envios)
  end

  def find(id)
    super(id)
  rescue ObjetoNoEncontrado
    raise EnvioNoEncontradoError
  end

  protected

  # rubocop:disable Metrics/AbcSize
  def load_object(a_hash)
    direccion = RepositorioDirecciones.new.find_by_id(a_hash[:id_direccion])
    cliente = RepositorioClientes.new.find_by_name(a_hash[:duenio])
    tamanio = FabricaTamanios.new.crear_tamanio(a_hash[:tamanio])
    envio = Envio.new(tamanio, direccion, cliente, a_hash[:id])
    envio.estado = FabricaEstados.new.crear_estado(a_hash[:estado])
    return envio if a_hash[:id_cadete].nil?

    envio.cadete = RepositorioCadetes.new.find_by_id(a_hash[:id_cadete])
    envio
  end
  # rubocop:enable Metrics/AbcSize

  def changeset(envio)
    {
      tamanio: envio.tamanio.tamanio,
      id_direccion: envio.direccion.id,
      id_cliente: envio.cliente.id_cliente.to_i,
      id_cadete: envio.cadete&.id_cadete.to_i,
      estado: envio.estado.estado,
      duenio: envio.cliente.nombre.downcase
    }
  end
end
