require_relative './abstract_repository'

class RepositorioEnvios < AbstractRepository
  self.table_name = :envios
  self.model_class = 'Envio'

  def find_unassigned
    envio = dataset.where(id_cadete: nil).first
    load_object(envio) unless envio.nil?
  end

  protected

  def load_object(a_hash)
    Envio.new(a_hash[:direccion], a_hash[:codigo_postal], a_hash[:id_cliente], a_hash[:id_cadete], a_hash[:id], a_hash[:estado])
  end

  def changeset(envio)
    {
      direccion: envio.direccion.direccion,
      codigo_postal: envio.direccion.codigo_postal,
      id_cliente: envio.id_cliente.to_i,
      id_cadete: envio.id_cadete&.to_i,
      estado: envio.estado
    }
  end
end
