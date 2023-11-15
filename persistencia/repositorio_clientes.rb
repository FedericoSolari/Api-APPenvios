require_relative './abstract_repository'

class RepositorioClientes < AbstractRepository
  self.table_name = :clientes
  self.model_class = 'Cliente'

  def find_by_id(id_cliente)
    found_record = dataset.first(pk_column => id_cliente)
    raise ObjectNotFound.new(self.class.model_class, id) if found_record.nil?

    load_object dataset.first(found_record)
  end

  protected

  def load_object(a_hash)
    Cliente.new(a_hash[:nombre], a_hash[:direccion], a_hash[:codigo_postal], a_hash[:id_cliente], a_hash[:id])
  end

  def changeset(cliente)
    {
      nombre: cliente.nombre,
      direccion: cliente.direccion,
      codigo_postal: cliente.codigo_postal,
      id_cliente: cliente.id_cliente
    }
  end
end
