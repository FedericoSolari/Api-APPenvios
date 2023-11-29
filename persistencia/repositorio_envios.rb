require_relative './abstract_repository'
require_relative '../fabricas/fabrica_estados'
require_relative '../fabricas/fabrica_tamanios'
require_relative '../fabricas/fabrica_de_tipos'
require_relative '../excepciones/envio_no_encontrado_error'
require_relative '../excepciones/envios_no_encontrados_error'
require_relative '../excepciones/objeto_no_encontrado_error'

class RepositorioEnvios < AbstractRepository
  self.table_name = :envios
  self.model_class = 'Envio'

  def find_by_state(estado)
    envio = dataset.where(estado:).first
    raise EnvioNoEncontradoError, "No se encontraron envios con estado #{estado}" if envio.nil?

    load_object(envio)
  end

  def find_with_filter(estado, tamanios, tipo)
    envio = dataset.where(estado:, tamanio: tamanios, tipo:).first
    raise EnvioNoEncontradoError, "No se encontraron envios con estado #{estado} y tamanio/s #{tamanios}" if envio.nil?

    load_object(envio)
  end

  def client_record(duenio)
    envios = dataset.where(duenio: duenio.downcase).reverse_order(:id).limit(5)
    raise EnviosNoEncontradosError, "No se encontraron envíos para el dueño #{duenio}" if envios.empty?

    load_collection(envios)
  end

  def find_by_type(tipo)
    envio = dataset.where(tipo:).first
    raise EnviosNoEncontradosError, "No se encontraron envíos con el tipo #{tipo}" if envio.nil?

    load_object(envio)
  end

  def find(id)
    super(id)
  rescue ObjetoNoEncontrado
    raise EnvioNoEncontradoError
  end

  protected

  # No encontramos manera de reducir la complejidad algoritmica
  # rubocop:disable Metrics/AbcSize
  def load_object(a_hash)
    direccion = RepositorioDirecciones.new.find_by_id(a_hash[:id_direccion])
    cliente = RepositorioClientes.new.find_by_name(a_hash[:duenio])
    tamanio = FabricaTamanios.new.crear_tamanio(a_hash[:tamanio])
    tipo_de_envio = FabricaTipoEnvios.new.crear_tipo_de_envio(a_hash[:tipo])
    envio = Envio.new(tamanio, direccion, cliente, tipo_de_envio, a_hash[:id])
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
      id_cliente: envio.cliente.id_cliente,
      id_cadete: envio.cadete&.id_cadete,
      estado: envio.estado.estado,
      duenio: envio.cliente.nombre.downcase,
      tipo: envio.tipo.tipo
    }
  end
end
