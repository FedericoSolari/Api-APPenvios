require_relative './abstract_repository'
require_relative '../fabricas/fabrica_estados'
require_relative '../fabricas/fabrica_tamanios'

class RepositorioEnvios < AbstractRepository
  self.table_name = :envios
  self.model_class = 'Envio'

  def find_by_state(estado)
    envio = dataset.where(estado:).first
    load_object(envio)
  end

  protected

  # rubocop:disable Metrics/AbcSize
  def load_object(a_hash)
    direccion = RepositorioDirecciones.new.find_by_id(a_hash[:id_direccion])
    cliente = RepositorioClientes.new.find_by_id(a_hash[:id_cliente])
    cadete = a_hash[:id_cadete].nil? ? nil : RepositorioCadetes.new.find_by_id(a_hash[:id_cadete])
    tamanio = FabricaTamanios.new.crear_tamanio(a_hash[:tamanio])
    Envio.new(tamanio, direccion, cliente, cadete, a_hash[:id], FabricaEstados.new.crear_estado(a_hash[:estado]))
  end
  # rubocop:enable Metrics/AbcSize

  def changeset(envio)
    {
      tamanio: envio.tamanio.tamanio,
      id_direccion: envio.direccion.id,
      id_cliente: envio.cliente.id_cliente.to_i,
      id_cadete: envio.cadete&.id_cadete.to_i,
      estado: envio.estado.estado
    }
  end
end
