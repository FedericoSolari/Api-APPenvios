require_relative './abstract_repository'

class RepositorioEnvios < AbstractRepository
  self.table_name = :envios
  self.model_class = 'Envio'

  def find_by_state(estado)
    envio = dataset.where(estado:).first
    load_object(envio)
  end

  protected

  def load_object(a_hash)
    cliente = RepositorioClientes.new.find_by_id(a_hash[:id_cliente])
    cadete = a_hash[:id_cadete].nil? ? nil : RepositorioCadetes.new.find_by_id(a_hash[:id_cadete])
    Envio.new(a_hash[:direccion], a_hash[:codigo_postal], cliente, cadete, a_hash[:id], a_hash[:estado])
  end

  def changeset(envio)
    {
      direccion: envio.direccion.direccion,
      codigo_postal: envio.direccion.codigo_postal,
      id_cliente: envio.cliente.id_cliente.to_i,
      id_cadete: envio.cadete&.id_cadete.to_i,
      estado: envio.estado
    }
  end
end
